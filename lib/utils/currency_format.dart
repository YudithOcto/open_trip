import 'package:intl/intl.dart';

class CurrencyFormat {
  static String formatToRupiah(num? value) {
    if (value == null || value == 0.0) {
      return 'Rp 0';
    }

    final formatter = NumberFormat('#,###');
    return "Rp ${formatter.format(value)}";
  }
}
