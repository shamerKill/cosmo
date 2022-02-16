import 'package:alan/alan.dart' as alan;
import 'package:plug/app/config/config.chain.dart';
import 'package:encrypt/encrypt.dart';

class WalletTool {
  static final _networkInfo = alan.NetworkInfo.fromSingleHost(
    bech32Hrp: ConfigChainData.addressPrex,
    host: ConfigChainData.chainInfoRpcUrl,
  );
  static List<String> creaetMnemonic () => alan.Bip39.generateMnemonic();
  static alan.Wallet walletForMnemonic (List<String> mnemonic) => alan.Wallet.derive(mnemonic, _networkInfo);
  static encryptMnemonic (List<String> mnemonic, String pass) {
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
}