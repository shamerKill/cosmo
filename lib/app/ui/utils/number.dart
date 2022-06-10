class NumberTool {
  static String formatNumberStr(String input) {
    String result = "";
    if (input == "") return "0";
    double? num = double.tryParse(input);
    if (num is! double) return input;
    List<String> inputSplit = input.split(".");
    List<String> splitArr = inputSplit[0].split("");
    String memResult = "";
    for (int i = splitArr.length - 1; i >= 0; i--) {
      int index = splitArr.length - 1 - i;
      memResult += splitArr[i];
      if (index % 3 == 2 && i != 0) memResult += ",";
    }
    for (int i = memResult.length - 1; i >= 0; i--) {
      result += memResult[i];
    }
    if (inputSplit.length > 1) result += "." + inputSplit[1];
    return result;
  }
  static String getNumberInt(String input) {
    List<String> inputSplit = input.split(".");
    return inputSplit[0];
  }
  static String getNumberDecimalPoint(String input) {
    List<String> inputSplit = input.split(".");
    if (inputSplit.length <= 1) return "";
    return ".${inputSplit[1]}";
  }
  static String getNumberLenStar(int num) {
    String result = "";
    for (int i = 0; i < num; i++) {
      result += "*";
    }
    return result;
  }
  static String amountToBalance(String input, { int scale = 6 }) {
    String _str = input.padLeft(scale + 1, '0');
    String _startStr = _str.substring(0, _str.length - scale);
    String _endStr = _str.substring(_str.length - scale);
    String result = _startStr + ('.' + _endStr).replaceFirst(RegExp('[0|.]+\$'), '');
    if (double.tryParse(result) == 0) return '0';
    return result;
  }
  static String balanceToAmount(String input, { int scale = 6 }) {
    List<String> _l = input.split('.');
    BigInt _mem = BigInt.zero;
    for (int i = 0; i < _l.length; i++) {
      String _str = (
        i == 0 ? 
          (_l[i] + ''.padRight(scale, '0')) :
          (_l[i].padRight(scale, '0'))
      );
      _mem += BigInt.parse(i == 0 ? _str : _str.substring(0, (scale + 1 - i)));
    }
    return _mem.toString();
  }
  static String doubleBalanceToAmount(double input, { int scale = 6 }) {
    List<String> _l = input.toString().split('.');
    BigInt _mem = BigInt.zero;
    for (int i = 0; i < _l.length; i++) {
      String _str = (
        i == 0 ? 
          (_l[i] + ''.padRight(scale, '0')) :
          (_l[i].padRight(scale, '0'))
      );
      _mem += BigInt.parse(i == 0 ? _str : _str.substring(0, (scale + 1 - i)));
    }
    return _mem.toString();
  }
  static String numMul(String one, String two, { int scale = 2}) {
    try {
      double douOne = double.parse(one);
      double douTwo = double.parse(two);
      return (douOne * douTwo).toStringAsFixed(scale);
    } catch (e) {
      return '';
    }
  }
}