import 'dart:async';
import 'dart:typed_data';
import 'dart:core';

import 'package:http/http.dart';
import 'package:plug/app/env/env.dart';
import 'package:plug/app/ui/utils/error.dart';
import 'package:plug/app/ui/utils/evm/evmWallet.dart';
import 'package:plug/app/ui/utils/http.dart';
import 'package:plug/app/ui/utils/string.dart';
import 'package:web3dart/crypto.dart';
import 'package:web3dart/web3dart.dart';

class EvmClient {
  late Web3Client ethClient;
  late NewWallet _cosmoWallet;
  late EthPrivateKey _ethPrivateKey;
  int? chainId;

  NewWallet get cosmoWallet => _cosmoWallet;
  EthPrivateKey get ethPrivateKey => _ethPrivateKey;
  EvmClient({
    // Cosmo/Evm Wallet
    required List<String> mnemonic,
    // EVM Wallet
    String? privateKey,
    // 8545
    String? apiUrl,
    // chainID
    this.chainId,
  }) {
    chainId = chainId??Env.envConfig.chainInfo.pvmChainId;
    ethClient = Web3Client(apiUrl??Env.envConfig.urlInfo.chainPvmRpcUrl, Client());
    _cosmoWallet = NewWallet.derive(mnemonic);
    _ethPrivateKey = EthPrivateKey.fromHex(cosmoWallet.hexPrivateKey);
    if (privateKey != null) {
      _ethPrivateKey = EthPrivateKey.fromHex(privateKey);
    }
  }
  // 合约函数处理
  static Uint8List toolFormatContractData(
    String callFunc, // 函数方法
    List? callArgs, // 函数参数
  ) {
    List _callArgs = [callFunc];
    _callArgs.addAll(callArgs??[]);
    List<int> dataArr = [];
    for (int i = 0; i < _callArgs.length; i++) {
      List<int> _item;
      var n = int.tryParse(_callArgs[i]);
      if (_callArgs[i].startsWith('0x')) {
        _item = List.from(hexToBytes(_callArgs[i]));
      } else if (n != null) {
        _item = List.from(intToBytes(BigInt.from(n)));
      } else {
        _item = List.from(keccakUtf8(_callArgs[i]));
      }
      if (i > 0) {
        while (_item.length < 32) {
          _item.insert(0, 0);
        }
      } else {
        _item = _item.sublist(0, 4);
      }
      dataArr.addAll(_item);
    }
    return Uint8List.fromList(dataArr);
  }
  // 处理大数
  static String toolFormatVolumeToHex(
    double volume,
    {
      int? scale,
    }
  ) {
    var _scale = scale??0;
    var _smallValue = BigInt.from(BigInt.from(10).pow(_scale).toInt() * (volume - volume.toInt()));
    var _absValue = BigInt.from(10).pow(_scale) * BigInt.from(volume.toInt());
    var hexStr = (_absValue + _smallValue).toRadixString(16);
    while(hexStr.length < 64) { hexStr = '0' + hexStr; }
    return '0x' + hexStr;
  }
  // 获取实际可读数量
  static double toolFormatToRealVolume(
    BigInt volume,
    {
      int? scale,
    }
  ) {
    var _scale = scale??0;
    var factor = BigInt.from(10).pow(_scale);
    final value = volume ~/ factor;
    final remainder = volume.remainder(factor);
    return value.toInt() + (remainder.toInt() / factor.toInt());
  }
  // 调用合约
  static Future<String?> callContract(
    String contractAddress, // 合约地址
    String callFunc, // 函数方法
    List<String>? callArgs, // 函数参数
  ) {
    return Web3Client(Env.envConfig.urlInfo.chainPvmRpcUrl, Client()).callRaw(
      contract: EthereumAddress.fromHex(contractAddress),
      data: toolFormatContractData(callFunc, callArgs),
    );
  }
  static Future<String?> callContractRaw(
    String contractAddress, // 合约地址
    Uint8List data,
  ) {
    return Web3Client(Env.envConfig.urlInfo.chainPvmRpcUrl, Client()).callRaw(
      contract: EthereumAddress.fromHex(contractAddress),
      data: data,
    );
  }
  // 获取账户合约余额
  static Future<BigInt> getContractBalance(
    String contractAddress, // 合约地址
    String hexAddress // 账户地址
  ) async {
    contractAddress = StringTool.checkChainAddress(contractAddress) ? StringTool.bech32ToHex(contractAddress) : contractAddress;
    var balance = await callContract(
      contractAddress,
      'balanceOf(address)',
      [
        hexAddress,
      ]
    );
    return hexToInt(balance??'');
  }
  /// EVM发送数据
  /// 
  /// * toAddress 合约地址/转账地址
  /// * data 数据
  /// * volume 转账数量
  /// * maxGas 最大gas数量
  /// * gasPrice gas数量
  Future<String> send(
    String toAddress,
    Uint8List? data,
    {
      BigInt? volume, // 转账数量
      int? maxGas, // 最大gas数量
      int? gasPrice, // gas数量
    }
  ) async {
    var _volume = volume??BigInt.from(0);
    var _gasPrice = gasPrice != null ? EtherAmount.inWei(BigInt.from(gasPrice)) : (await ethClient.getGasPrice());
    var _maxGas = maxGas??(await ethClient.estimateGas(
      sender: ethPrivateKey.address,
      to: EthereumAddress.fromHex(toAddress),
      gasPrice: _gasPrice,
      value: EtherAmount.inWei(_volume),
      data: data,
    )).toInt();
    return ethClient.sendTransaction(
      ethPrivateKey,
      Transaction(
        from: ethPrivateKey.address,
        to: EthereumAddress.fromHex(toAddress),
        gasPrice: _gasPrice,
        maxGas: _maxGas,
        value: EtherAmount.inWei(_volume),
        data: data,
      ),
      chainId: chainId
    );
  }
  Future<HttpToolResponse> sendAsync(
    String toAddress,
    Uint8List? data,
    {
      BigInt? volume, // 转账数量
      int? maxGas, // 最大gas数量
      int? gasPrice, // gas数量
    }
  ) async {
    var hash = '';
    try {
      hash = await send(toAddress, data, volume: volume, maxGas: maxGas, gasPrice: gasPrice);
    } catch (e) {
      return Future.value(HttpToolResponse({
        'status': ErrorCode.signError,
        'data': e.toString(),
      }));
    }
    if (hash == '') {
      return Future.value(HttpToolResponse({
        'status': ErrorCode.signError,
        'data': 'no balance',
      }));
    }
    Completer<HttpToolResponse> compute = Completer();
    var isSuccessEnd = 0; // 10结束
    HttpToolResponse result = HttpToolResponse(null);
    Timer.periodic(const Duration(seconds: 3), (timer) async {
      var res = await ethClient.getTransactionReceipt(hash);
      if (res != null) {
        if (res.status == true) {
          result.data = res.toString();
          result.status = 0;
          result.message = 'ok';
        } else {
          result.status = ErrorCode.signError;
        }
        timer.cancel();
        compute.complete(result);
      } else if (isSuccessEnd++ == 10) {
        timer.cancel();
        result.status = ErrorCode.timeError; // 查询超时
        result.message = 'error';
        compute.complete(result);
      }
    });
    return compute.future;
  }
}