import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'number_input_formatter.dart';

/// @author: xiao
/// created on: 2025/1/23 11:04
/// description:
class Utils {
  static List<TextInputFormatter>? getInputFormatters(
      TextInputType keyboardType) {
    if (keyboardType == const TextInputType.numberWithOptions(decimal: true)) {
      return <TextInputFormatter>[UsNumberTextInputFormatter()];
    }
    if (keyboardType == TextInputType.number ||
        keyboardType == TextInputType.phone) {
      return <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly];
    }
    return null;
  }

  static String formatCurrencyPlusOrMinus(double? amount,
      {String currencySymbol = ''}) {
    if (amount == null) {
      return '¥0.00';
    }
    String minus = amount < 0 ? '-' : '+';
    double d0 = amount.abs();
    return minus +
        NumberFormat.simpleCurrency(
          name: currencySymbol,
          decimalDigits: 2,
        ).format(d0);
  }
}
