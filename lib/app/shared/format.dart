import 'package:intl/intl.dart';

String? formatMoney(double? value) {
  if (value != null) {
    final oCcy = NumberFormat("#,##0.00", "pt_BR");
    return 'R\$ ${oCcy.format(value)}';
  }
  return null;
}
