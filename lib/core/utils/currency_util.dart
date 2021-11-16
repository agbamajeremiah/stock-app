import 'package:intl/intl.dart';

class CurrencyUtil {
  static String formatAmountInt(int value) {
    final f = NumberFormat('\$#,##0', 'en_US');
    return f.format(value);
  }
}
