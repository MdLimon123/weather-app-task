import 'package:hive_flutter/adapters.dart';
class HiveManage {
   static Future<void> initHive() async {
    await Hive.initFlutter();
    await Hive.openBox('weatherData');
  }
}