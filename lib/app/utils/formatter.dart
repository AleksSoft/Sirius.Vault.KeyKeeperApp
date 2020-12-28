import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:get/utils.dart';

class Formatter {
  static String currency(
    String s, {
    int fractionDigits,
    String prefix,
    String suffix,
    String orElse,
  }) {
    double amount = double.tryParse(s ?? '0.0') ?? 0.0;
    if (amount == 0 && !orElse.isNullOrBlank) return orElse;

    int fractionDigitsLength = s.substring(s.indexOf(".")).length;

    String formatPrefix = prefix == null ? '' : '$prefix ';
    String formatSuffix = suffix == null ? '' : ' $suffix';

    var fmf = FlutterMoneyFormatter(amount: amount);
    fmf = fmf.copyWith(fractionDigits: fractionDigits ?? fractionDigitsLength);

    return '$formatPrefix${fmf.output.nonSymbol}$formatSuffix';
  }
}
