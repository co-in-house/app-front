import 'package:intl/intl.dart';

class NumberUtil {
  static final numberFormat = NumberFormat("#,###");
  static String formattedInteger(int number) {
    return numberFormat.format(number);
  }
}
