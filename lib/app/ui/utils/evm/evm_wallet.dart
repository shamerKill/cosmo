import 'dart:typed_data';
import 'package:alan/alan.dart';
import 'package:pointycastle/export.dart';
import 'package:hex/hex.dart';
import 'package:dart_bech32/dart_bech32.dart' as bech32;
import 'package:web3dart/crypto.dart' as crypto;
import 'package:web3dart/web3dart.dart' as web3;
// ignore: implementation_imports
import 'package:web3dart/src/utils/typed_data.dart';

class NewWallet extends Wallet {
  static const derivationPath = "m/44'/60'/0'/0/0";
  static NetworkInfo defaultNetworkInfo = NetworkInfo.fromSingleHost(
    bech32Hrp: 'gx',
    host: '',
  );

  final Uint8List comPublicKeyBytes;

  NewWallet({
    required NetworkInfo networkInfo,
    required Uint8List address,
    required Uint8List privateKey,
    required Uint8List publicKey,
    required this.comPublicKeyBytes,
  }) : super(
          networkInfo: networkInfo,
          address: address,
          privateKey: privateKey,
          publicKey: publicKey,
        );

  @override
  factory NewWallet.derive(
    List<String> mnemonic, {
    NetworkInfo? networkInfo,
    String derivationPath = derivationPath,
  }) {
    networkInfo ??= defaultNetworkInfo;
    // Validate the mnemonic
    if (!Bip39.validateMnemonic(mnemonic)) {
      throw Exception('Invalid mnemonic');
    }

    // Convert the mnemonic to a BIP32 instance
    final seed = Bip39.mnemonicToSeed(mnemonic);
    final root = Bip32.fromSeed(seed);

    // Get the node from the derivation path
    final derivedNode = root.derivePath(derivationPath);

    // Get the curve data
    final secp256k1 = ECCurve_secp256k1();
    final point = secp256k1.G;

    // Compute the curve point associated to the private key
    final bigInt = BigInt.parse(HEX.encode(derivedNode.privateKey!), radix: 16);
    final curvePoint = point * bigInt;

    // Get the public key
    final publicKeyBytes = curvePoint!.getEncoded(false);
    final comPublicKeyBytes = curvePoint.getEncoded();

    // Get the address
    final sha256Digest = SHA256Digest().process(comPublicKeyBytes);
    final address = RIPEMD160Digest().process(sha256Digest);

    // Return the key bytes
    return NewWallet(
      address: address,
      comPublicKeyBytes: comPublicKeyBytes,
      publicKey: publicKeyBytes,
      privateKey: derivedNode.privateKey!,
      networkInfo: networkInfo,
    );
  }
  @override
  get bech32Address {
    var hash = keccak256(publicKey.sublist(1));
    // var data = HexEncoder().convert(hash.sublist(12));
    var address = bech32.bech32.encode(bech32.Decoded(
      prefix: 'gx',
      words: bech32.bech32.toWords(hash.sublist(12)),
    ));
    return address;
  }

  @override
  Uint8List sign(Uint8List data) {
    var seckey =
        crypto.intToBytes(_getPvKey(PrivateKeyParameter(_ecPrivateKey)).d!);
    List<int> seckeyList = List.from(seckey);
    if ((seckeyList.length % 8) != 0) {
      seckeyList.removeAt(0);
    }
    seckey = Uint8List.fromList(seckeyList);
    if (seckey.length % 8 != 0) {
      seckey = privateKey;
    }
    final signature = crypto.sign(keccak256(data), seckey);
    final r = padUint8ListTo32(crypto.unsignedIntToBytes(signature.r));
    final s = padUint8ListTo32(crypto.unsignedIntToBytes(signature.s));
    final v = crypto.unsignedIntToBytes(BigInt.from(signature.v));
    return uint8ListFromList(r + s + v);
  }

  ECPrivateKey _getPvKey(CipherParameters params) {
    PrivateKeyParameter prevParams;
    if (params is ParametersWithRandom) {
      prevParams = params.parameters as PrivateKeyParameter<PrivateKey>;
    } else {
      prevParams = params as PrivateKeyParameter<PrivateKey>;
    }
    return prevParams.key as ECPrivateKey;
  }

  ECPrivateKey get _ecPrivateKey {
    final privateKeyInt = BigInt.parse(HEX.encode(privateKey), radix: 16);
    return ECPrivateKey(privateKeyInt, ECCurve_secp256k1());
  }

  ECSignature _normalizeECSignature(
    ECSignature signature,
    ECDomainParameters curveParams,
  ) {
    var normalizedS = signature.s;
    if (normalizedS.compareTo(curveParams.n >> 1) > 0) {
      normalizedS = curveParams.n - normalizedS;
    }
    return ECSignature(signature.r, normalizedS);
  }

  String get hexAddress {
    return web3.EthPrivateKey.fromHex(hexPrivateKey).address.toString();
  }

  String get hexPrivateKey {
    return crypto.bytesToHex(privateKey);
  }
}

Uint8List keccak256(Uint8List input, {int type = 256}) {
  final KeccakDigest keccakDigest = KeccakDigest(type);
  keccakDigest.reset();
  return keccakDigest.process(input);
}
