import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:weather_app/views/screens/splash_screen.dart';
import 'package:weather_app/views/screens/weather_screen.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
   // Initialize Hive
  await Hive.initFlutter();
  
  // Open a Hive box to store weather data
  await Hive.openBox('weatherBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen()
    );
  }
}

