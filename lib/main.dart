import 'package:flutter/material.dart';
import 'package:insighta/app.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();//جسر مع نظام التشغيل 
  await initializeDateFormatting('ar', null);
  runApp(const SmartFarmerApp());
}