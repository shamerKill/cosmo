import 'dart:math';

import 'package:decimal/decimal.dart';
import 'package:flustars/flustars.dart';

class NumberTool {
  static String formatNumberStr(String input) {
    String reulst = "";
    if (input == "") return "0";
    double num = double.parse(input);
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
      reulst += memResult[i];
    }
    if (inputSplit.length > 1) reulst += "." + inputSplit[1];
    return reulst;
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
  static String amountToBalance(String input, { scale = 6}) {
    double? num = double.tryParse(input);
    if (num == null) return input;
    return NumUtil.divide(num, pow(10, scale)).toString();
  }
  static String balanceToAmount(String input, { scale = 6, bool? ceil }) {
    double? num = double.tryParse(input);
    if (num == null) return input;
    double scalDouble = num * pow(10, scale);
    return Decimal.fromInt(
      ceil == true ? scalDouble.ceil() : (
        ceil == false ? scalDouble.floor() : NumUtil.getNumByValueDouble(scalDouble, 0)!.toInt()
      )
    ).toString();
  }
  static String doubleBalanceToAmount(double input, { scale = 6, bool ceil = false}) {
    int scalInt = 1;
    for (var _ = 0; _ < scale; _++) {
      scalInt *= 10;
    }
    return Decimal.fromInt(ceil ? (scalInt * input).ceil() : (scalInt * input).floor()).toString();
  }
}