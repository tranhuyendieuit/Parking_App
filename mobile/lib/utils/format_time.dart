import 'package:intl/intl.dart';
extension DateTimeFormatting on DateTime {
  String formatDate() {
    return DateFormat('yyyy-MM-dd HH:mm:ss').format(this);
  }
}


extension StringDateTimeFormatter on String {
  String toFormattedDateTime() {
    try {
      final DateTime dateTime = DateFormat('dd/MM/yyyy HH:mm:ss').parse(this);
      return DateFormat('dd/MM/yyyy h:mm a').format(dateTime);
    } catch (e) {
      return this;
    }
  }
}