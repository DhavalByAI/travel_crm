import 'package:intl/intl.dart';

String convertDate({required String date, DateFormat? format}) {
  DateTime dateTime = DateTime.parse(date);
  String formattedDateTime =
      (format ?? DateFormat('yyyy-MM-dd HH:mm:ss')).format(dateTime);
  return formattedDateTime;
}
