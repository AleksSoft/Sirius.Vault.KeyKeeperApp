import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Formatter {
  static const int minDecimal = 2;
  static const int maxDecimalDigits = 8;

  static String currency(
    String s, {
    int maxDecimal,
    String symbol,
    String locale,
    String ifZeroOrNull,
  }) {
    if (s.isNullOrBlank) {
      if (!ifZeroOrNull.isNullOrBlank) {
        return ifZeroOrNull;
      } else {
        s = s.isNullOrBlank ? '0.0' : s;
      }
    } else if ((double.tryParse(s) ?? 0.0) == 0) {
      if (!ifZeroOrNull.isNullOrBlank) return ifZeroOrNull;
    }

    String formatSymbol = symbol.isNullOrBlank ? '' : '$symbol ';
    int decimalDigits = maxDecimal == null ? minDecimal : maxDecimal;

    return '$formatSymbol${NumberFormat.currency(
      locale: locale ?? 'eu',
      symbol: '',
      decimalDigits: decimalDigits,
    ).format(double.tryParse(s) ?? 0.0)}';
  }
}
