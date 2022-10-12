import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:alan/alan.dart' as alan;
import 'package:alan/proto/cosmos/bank/v1beta1/export.dart' as bank;
import 'package:flustars/flustars.dart';
import 'package:alan/proto/cosmos/auth/v1beta1/export.dart' as auth;
import 'package:alan/proto/cosmos/auth/v1beta1/auth.pb.dart' as auth_pb;
import 'package:alan/proto/cosmos/staking/v1beta1/tx.pb.dart' as staking;
import 'package:alan/proto/cosmos/gov/v1beta1/tx.pb.dart' as gov;
import 'package:alan/proto/cosmos/gov/v1beta1/gov.pb.dart' as gov_def;
import 'package:alan/proto/cosmos/distribution/v1beta1/tx.pb.dart'
    as distribution;
import 'package:alan/proto/google/protobuf/any.pb.dart' as any_pb;
import 'package:encrypt/encrypt.dart';
import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:flutter/foundation.dart' as foundation;
import 'package:get/instance_manager.dart';
import 'package:grpc/grpc.dart' as grpc;
import 'package:http/http.dart' as http;
import 'package:alan/proto/cosmos/crypto/secp256k1/export.dart' as secp256;
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/data/provider/data.account.dart';
import 'package:plug/app/data/provider/data.base-coin.dart';
import 'package:plug/app/data/services/net.services.dart';
import 'package:plug/app/env/env.dart';
import 'package:plug/app/ui/utils/evm/evm_wallet.dart';
import 'package:plug/app/ui/utils/http.dart';
import 'package:protobuf/protobuf.dart';
import 'package:plug/protobuf/chain/token/tx.pb.dart' as token_tx;
import 'package:plug/protobuf/chain/liquidity/v1beta1/tx.pb.dart'
    as liquidity_tx;
import 'package:plug/protobuf/chain/signer/v1beta1/signer.pb.dart' as secp2561;

List<int> errorCode = [
  -10001, // 签名数据有误
  -10002, // 请求交易签名hash超时
];

class SelfAuthQuerier extends alan.AuthQuerier {
  final alan.Wallet wallet;
  EnumAccountType addressType;

  SelfAuthQuerier({
    required auth.QueryClient client,
    required this.wallet,
    required this.addressType,
  }) : super(client: client);

  @override
  factory SelfAuthQuerier.build(alan.Wallet wallet, grpc.ClientChannel channel,
      {EnumAccountType? addressType}) {
    return SelfAuthQuerier(
        client: auth.QueryClient(channel),
        wallet: wallet,
        addressType: addressType ?? EnumAccountType.prc10);
  }
  @override
  Future<alan.AccountI?> getAccountData(String address) async {
    any_pb.Any pubKey;
    if (addressType == EnumAccountType.prc20) {
      // 短公钥
      var secp256Key = secp2561.PubKey.create()
        ..key = (wallet as dynamic).comPublicKeyBytes;
      pubKey = alan.Codec.serialize(secp256Key);
    } else {
      // 长公钥
      var secp256Key = secp256.PubKey.create()..key = wallet.publicKey;
      pubKey = alan.Codec.serialize(secp256Key);
    }
    var accountResult = await httpToolApp.getAccountChainInfo(address);
    String accountNumber = '0';
    String sequence = '0';
    dynamic accountInfo;
    if (accountResult?.data['@type'] == '/cosmos.auth.v1beta1.BaseAccount') {
      accountInfo = accountResult?.data;
    } else {
      accountInfo = accountResult?.data['base_account'];
    }
    if (accountResult != null) {
      if (accountResult.data["account_number"] != '') {
        accountNumber = '${accountInfo["account_number"]}';
      }
      if (accountResult.data["sequence"] != '') {
        sequence = '${accountInfo["sequence"]}';
      }
    }
    return alan.BaseAccount(auth_pb.BaseAccount(
      address: wallet.bech32Address,
      pubKey: pubKey,
      accountNumber: $fixnum.Int64.parseInt(accountNumber),
      sequence: $fixnum.Int64.parseInt(sequence),
    ));
  }
}

class SelfNodeQuerier extends alan.QueryHelper implements alan.NodeQuerier {
  SelfNodeQuerier._({
    required http.Client httpClient,
  }) : super(httpClient: httpClient);

  factory SelfNodeQuerier.build(http.Client httpClient) {
    return SelfNodeQuerier._(httpClient: httpClient);
  }
  @override
  Future<alan.NodeInfo> getNodeInfo(String lcdEndpoint) async {
    return alan.NodeInfo(
      network: Env.envConfig.chainInfo.appChainId,
    );
  }
}

class WalletTool {
  static final _networkInfo = alan.NetworkInfo.fromSingleHost(
    bech32Hrp: Env.envConfig.chainInfo.addressPrefix,
    host: Env.envConfig.urlInfo.chainInfoRpcUrl,
  );
  static Future<HttpToolResponse> _createAndSendMsg(
    alan.Wallet wallet,
    List<GeneratedMessage> msgs,
    String memo,
    $fixnum.Int64 gasLimit,
    String gasAll, {
    bool? noWait,
  }) async {
    DataCoinsController dataCoins = Get.find();
    DataAccountController dataAccountController = Get.find();
    alan.TxSigner signer;
    if (dataAccountController.state.nowAccount?.accountType ==
        EnumAccountType.prc20) {
      signer = alan.TxSigner(
        nodeQuerier: SelfNodeQuerier.build(http.Client()),
        authQuerier: SelfAuthQuerier.build(wallet, _networkInfo.gRPCChannel,
            addressType: EnumAccountType.prc20),
      );
    } else {
      signer = alan.TxSigner(
        nodeQuerier: SelfNodeQuerier.build(http.Client()),
        authQuerier: SelfAuthQuerier.build(wallet, _networkInfo.gRPCChannel),
      );
    }
    alan.Tx tx = await signer.createAndSign(
      wallet,
      msgs,
      memo: memo,
      fee: alan.Fee(
        gasLimit: gasLimit,
        amount: [
          alan.Coin.create()
            ..denom = dataCoins.state.baseCoin.minUnit
            ..amount = gasAll
        ],
      ),
    );
    var config = alan.DefaultTxConfig.create();
    var encoder = config.txEncoder();
    var request = base64.encode(encoder(tx));
    HttpToolResponse result = await _walletSendFetch(
        'broadcast_tx_async', {'tx': request},
        noWait: noWait);
    return result;
  }

  static Future<HttpToolResponse> _fetchDefault(
      String method, Map<String, dynamic> params) {
    String data = json.encode({
      'jsonrpc': '2.0',
      'id': '${Random(1000).nextInt(1000000000)}',
      'method': method,
      'params': params,
    });
    return HttpToolClient.postHttp(
      Uri.parse(Env.envConfig.urlInfo.chainMoreRpcUrl),
      data: data,
    );
  }

  static Future<HttpToolResponse> _walletSendFetch(
      String method, Map<String, dynamic> params,
      {bool? noWait}) async {
    var result = await _fetchDefault(method, params);
    Completer<HttpToolResponse> compute = Completer();
    if (result.data == null ||
        result.data['result'] == null ||
        result.data['result']['code'] != 0) {
      result.status = errorCode[0]; // 发送出错
      result.message = 'error';
      return result;
    } else {
      if (noWait == true) {
        return result;
      }
      var isSuccessEnd = 0; // 10结束
      Timer.periodic(const Duration(seconds: 3), (timer) async {
        var successResult = await _fetchDefault('tx_search', {
          'query': 'tx.hash=\'' + result.data['result']['hash'] + '\'',
          'page': '1',
          'prove': false
        });
        if (successResult.data['result']['total_count'] != '0') {
          timer.cancel();
          result.data = successResult.data;
          if (successResult.data['result']['txs'][0]['tx_result']['code'] !=
              0) {
            result.status = successResult.data['result']['txs'][0]['tx_result']
                ['code']; // 发送出错
            result.message = 'error';
          }
          compute.complete(result);
          return;
        }
        if (isSuccessEnd++ == 10) {
          timer.cancel();
          result.status = errorCode[1]; // 查询超时
          result.message = 'error';
          compute.complete(result);
          return;
        }
      });
    }
    return compute.future;
  }

  // 创建账户助记词
  static List<String> createMnemonic() {
    var list = alan.Bip39.generateMnemonic();
    var setList = list.toSet();
    if (setList.length != list.length) return createMnemonic();
    return list;
  }

  // 解压助记词
  static alan.Wallet walletForMnemonic(List<String> mnemonic) =>
      alan.Wallet.derive(mnemonic, _networkInfo);
  static NewWallet walletForMnemonicPrc20(List<String> mnemonic) {
    return NewWallet.derive(mnemonic, networkInfo: _networkInfo);
  }

  /// 检查助记词
  static bool checkMnemonic(List<String> mnemonic) {
    return alan.Bip39.validateMnemonic(mnemonic);
  }

  /// 加密
  static encryptMnemonic(List<String> mnemonic, String pass) {
    String keyPass = pass;
    while (keyPass.length < 32) {
      keyPass += '0';
    }
    final key = Key.fromUtf8(keyPass);
    final fernet = Fernet(key);
    final encrypter = Encrypter(fernet);
    final encrypted = encrypter.encrypt(mnemonic.join('_'));
    return encrypted.base64;
  }

  /// 解压
  static FutureOr<List<String>?> decryptMnemonic(String raw, String pass) {
    List<String>? decrypt(String joinPass) {
      List<String> joinPassList = joinPass.split('____________');
      String raw = joinPassList[0];
      String keyPass = joinPassList[1];
      while (keyPass.length < 32) {
        keyPass += '0';
      }
      final key = Key.fromUtf8(keyPass);
      final fernet = Fernet(key);
      final encrypter = Encrypter(fernet);
      try {
        final mnemonic = encrypter.decrypt(Encrypted.fromBase64(raw));
        return mnemonic.split('_');
      } catch (err) {
        return null;
      }
    }

    return foundation.compute(decrypt, '${raw}____________$pass');
  }

  static alan.Wallet getWallet(List<String> mnemonic) {
    DataAccountController dataAccountController = Get.find();
    if (dataAccountController.state.nowAccount?.accountType ==
        EnumAccountType.prc20) return walletForMnemonicPrc20(mnemonic);
    return walletForMnemonic(mnemonic);
  }

  // 赎回收益
  static Future<HttpToolResponse> withReward({
    required List<String> mnemonic,
    required String validatorAddress,
    required String gasAll,
    String memo = '',
    int? gasLimit,
  }) async {
    $fixnum.Int64 gasLimitInt =
        (gasLimit == null ? 200000.toInt64() : gasLimit.toInt64());
    var wallet = getWallet(mnemonic);
    var message = distribution.MsgWithdrawDelegatorReward.create()
      ..delegatorAddress = wallet.bech32Address
      ..validatorAddress = validatorAddress;
    return _createAndSendMsg(wallet, [message], memo, gasLimitInt, gasAll);
  }

  // 赎回质押
  static Future<HttpToolResponse> unDelegate({
    required List<String> mnemonic,
    required String validatorAddress,
    required String volume,
    required String gasAll,
    String memo = '',
    int? gasLimit,
  }) async {
    $fixnum.Int64 gasLimitInt =
        (gasLimit == null ? 200000.toInt64() : gasLimit.toInt64());
    DataCoinsController dataCoins = Get.find();
    var wallet = getWallet(mnemonic);
    var message = staking.MsgUndelegate.create()
      ..delegatorAddress = wallet.bech32Address
      ..validatorAddress = validatorAddress
      ..amount = (alan.Coin.create()
        ..denom = dataCoins.state.baseCoin.minUnit
        ..amount = volume);
    return _createAndSendMsg(wallet, [message], memo, gasLimitInt, gasAll);
  }

  // 质押
  static Future<HttpToolResponse> delegate({
    required List<String> mnemonic,
    required String validatorAddress,
    required String volume,
    required String gasAll,
    String memo = '',
    int? gasLimit,
  }) async {
    $fixnum.Int64 gasLimitInt =
        (gasLimit == null ? 200000.toInt64() : gasLimit.toInt64());
    DataCoinsController dataCoins = Get.find();
    var wallet = getWallet(mnemonic);
    var message = staking.MsgDelegate.create()
      ..delegatorAddress = wallet.bech32Address
      ..validatorAddress = validatorAddress
      ..amount = (alan.Coin.create()
        ..denom = dataCoins.state.baseCoin.minUnit
        ..amount = volume);
    return _createAndSendMsg(wallet, [message], memo, gasLimitInt, gasAll);
  }

  // 转让质押
  static Future<HttpToolResponse> reDelegate({
    required List<String> mnemonic,
    required String validatorSrcAddress,
    required String validatorDstAddress,
    required String volume,
    required String gasAll,
    String memo = '',
    int? gasLimit,
  }) async {
    $fixnum.Int64 gasLimitInt =
        (gasLimit == null ? 200000.toInt64() : gasLimit.toInt64());
    DataCoinsController dataCoins = Get.find();
    var wallet = getWallet(mnemonic);
    var message = staking.MsgBeginRedelegate.create()
      ..delegatorAddress = wallet.bech32Address
      ..validatorSrcAddress = validatorSrcAddress
      ..validatorDstAddress = validatorDstAddress
      ..amount = (alan.Coin.create()
        ..denom = dataCoins.state.baseCoin.minUnit
        ..amount = volume);
    return _createAndSendMsg(wallet, [message], memo, gasLimitInt, gasAll);
  }

  // 转账
  static Future<HttpToolResponse> transfer({
    required List<String> mnemonic,
    required String toAddress,
    required String volume,
    required String gasAll,
    required String denom,
    String memo = '',
    int? gasLimit,
    bool? noWait,
  }) async {
    $fixnum.Int64 gasLimitInt =
        (gasLimit == null ? 200000.toInt64() : gasLimit.toInt64());
    var wallet = getWallet(mnemonic);
    var message = bank.MsgSend.create()
      ..fromAddress = wallet.bech32Address
      ..toAddress = toAddress
      ..amount.add(alan.Coin.create()
        ..denom = denom
        ..amount = volume);
    return _createAndSendMsg(wallet, [message], memo, gasLimitInt, gasAll,
        noWait: noWait);
  }

  // 进行投票
  static Future<HttpToolResponse> proposalVote({
    required List<String> mnemonic,
    required String proposalId,
    required gov_def.VoteOption option,
    required String gasAll,
    String memo = '',
    int? gasLimit,
  }) async {
    $fixnum.Int64 gasLimitInt =
        (gasLimit == null ? 200000.toInt64() : gasLimit.toInt64());
    var wallet = getWallet(mnemonic);
    var message = gov.MsgVote.create()
      ..voter = wallet.bech32Address
      ..proposalId = $fixnum.Int64.parseInt(proposalId)
      ..option = option;
    return _createAndSendMsg(wallet, [message], memo, gasLimitInt, gasAll);
  }

  // 创建代币
  static Future<HttpToolResponse> createToken({
    required List<String> mnemonic,
    required String name,
    required String symbol,
    required String minUnit,
    required String initialSupply,
    required String maxSupply,
    required bool mintable,
    required String scale,
    required String gasAll,
    String memo = '',
    int? gasLimit,
  }) async {
    $fixnum.Int64 gasLimitInt =
        (gasLimit == null ? 400000.toInt64() : gasLimit.toInt64());
    var wallet = getWallet(mnemonic);
    String memo = '';
    var message = token_tx.MsgIssueToken.create()
      ..owner = wallet.bech32Address
      ..name = name
      ..symbol = symbol
      ..minUnit = minUnit
      ..initialSupply = $fixnum.Int64.parseInt(initialSupply)
      ..maxSupply = $fixnum.Int64.parseInt(maxSupply)
      ..mintable = mintable
      ..scale = int.parse(scale);
    return _createAndSendMsg(wallet, [message], memo, gasLimitInt, gasAll);
  }

  // token10 swap
  static Future<HttpToolResponse> dexPoolExchange({
    required List<String> mnemonic,
    required int poolId,
    required String fromSymbol,
    required String fromAmount,
    required String toSymbol,
    required String feeAmount,
    required double orderPrice,
    required String gasAll,
    String memo = '',
    int? gasLimit,
  }) {
    $fixnum.Int64 gasLimitInt =
        (gasLimit == null ? 400000.toInt64() : gasLimit.toInt64());
    var wallet = getWallet(mnemonic);
    var message = liquidity_tx.MsgSwapWithinBatch.create()
      ..swapRequesterAddress = wallet.bech32Address
      ..poolId = poolId.toInt64()
      ..swapTypeId = 1
      ..offerCoin = (alan.Coin.create()
        ..denom = fromSymbol
        ..amount = fromAmount)
      ..demandCoinDenom = toSymbol
      ..offerCoinFee = (alan.Coin.create()
        ..denom = fromSymbol
        ..amount = feeAmount)
      ..orderPrice =
          NumUtil.multiplyDec(orderPrice, pow(10, 18)).toStringAsFixed(0);
    return _createAndSendMsg(wallet, [message], memo, gasLimitInt, gasAll);
  }

  // create token10 swap
  static Future<HttpToolResponse> dexPoolCreateExchange({
    required List<String> mnemonic,
    required String fromSymbol,
    required String fromAmount,
    required String toSymbol,
    required String toAmount,
    required String gasAll,
    String memo = '',
    int? gasLimit,
  }) {
    $fixnum.Int64 gasLimitInt =
        (gasLimit == null ? 400000.toInt64() : gasLimit.toInt64());
    var wallet = getWallet(mnemonic);
    var message = liquidity_tx.MsgCreatePool.create()
      ..poolCreatorAddress = wallet.bech32Address
      ..poolTypeId = 1
      ..depositCoins.addAll([
        (alan.Coin.create()
          ..denom = fromSymbol
          ..amount = fromAmount),
        (alan.Coin.create()
          ..denom = toSymbol
          ..amount = toAmount)
      ]);
    return _createAndSendMsg(wallet, [message], memo, gasLimitInt, gasAll);
  }

  // add token10 swap
  static Future<HttpToolResponse> dexPoolAddExchange({
    required List<String> mnemonic,
    required int poolId,
    required String fromSymbol,
    required String fromAmount,
    required String toSymbol,
    required String toAmount,
    required String gasAll,
    String memo = '',
    int? gasLimit,
  }) {
    $fixnum.Int64 gasLimitInt =
        (gasLimit == null ? 400000.toInt64() : gasLimit.toInt64());
    var wallet = getWallet(mnemonic);
    var message = liquidity_tx.MsgDepositWithinBatch.create()
      ..depositorAddress = wallet.bech32Address
      ..poolId = poolId.toInt64()
      ..depositCoins.addAll([
        (alan.Coin.create()
          ..denom = fromSymbol
          ..amount = fromAmount),
        (alan.Coin.create()
          ..denom = toSymbol
          ..amount = toAmount)
      ]);
    return _createAndSendMsg(wallet, [message], memo, gasLimitInt, gasAll);
  }

  // remove token10 swap
  static Future<HttpToolResponse> dexPoolRemoveExchange({
    required List<String> mnemonic,
    required int poolId,
    required String fromSymbol,
    required String fromAmount,
    required String gasAll,
    String memo = '',
    int? gasLimit,
  }) {
    $fixnum.Int64 gasLimitInt =
        (gasLimit == null ? 400000.toInt64() : gasLimit.toInt64());
    var wallet = getWallet(mnemonic);
    var message = liquidity_tx.MsgWithdrawWithinBatch.create()
      ..withdrawerAddress = wallet.bech32Address
      ..poolId = poolId.toInt64()
      ..poolCoin = (alan.Coin.create()
        ..denom = fromSymbol
        ..amount = fromAmount);
    return _createAndSendMsg(wallet, [message], memo, gasLimitInt, gasAll);
  }
}
