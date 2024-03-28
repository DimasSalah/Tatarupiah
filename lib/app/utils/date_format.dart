import 'package:intl/intl.dart';

//example sab, jan 01
String appBarDate(DateTime date) {
  return DateFormat('E, MMM dd').format(date);
}

//example 01 Jan 2022
String statusDate(DateTime date) {
  return DateFormat('dd MMM yyyy').format(date);
}