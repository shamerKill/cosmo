class VerifyTool {
  static bool password(String pass) {
    RegExp reg = RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d_-]{8,}$");
    return reg.hasMatch(pass);
  }
  static bool verifyAddress(String address) {
    RegExp reg = RegExp(r"^gx[0-9a-zA-Z]{39}$");
    return reg.hasMatch(address);
  }
}