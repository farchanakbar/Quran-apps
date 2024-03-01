import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', '');
  String dateString = '2024-3-1';
  DateFormat format = DateFormat("yyyy-MM-dd");
  DateTime dateTime = format.parse(dateString);
  String date = DateFormat.yMMMMEEEEd('id').format(dateTime);
  print(date);
}
