import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Formatter {
  static String currency(
    String s, {
    int decimalDigits,
    String prefix,
    String suffix,
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

    String formatPrefix = prefix == null ? '' : '$prefix ';
    String formatSuffix = suffix == null ? '' : ' $suffix';

    return '$formatPrefix${NumberFormat.currency(
      locale: locale ?? 'eu',
      symbol: '',
      decimalDigits: decimalDigits,
    ).format(double.tryParse(s) ?? 0.0)}$formatSuffix';
  }
}
