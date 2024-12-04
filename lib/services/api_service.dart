import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class ApiService {

 static const String _baseUrl = 'https://api.openweathermap.org/data/2.5/weather';
  static const String _apiKey = '0d191f4949cd5ded9894fa6b6b8b9c7d';

  Future<WeatherModel> fetchWeatherData() async {
    final url = Uri.parse('$_baseUrl?id=2172797&appid=$_apiKey&units=metric');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      // Cache the data in Hive
      final box = Hive.box('weatherBox');
      box.put('weatherData', data);

      return WeatherModel.fromApi(data);
    } else {
      throw Exception('Failed to fetch weather data');
    }
  }

  WeatherModel? getCachedWeatherData() {
    final box = Hive.box('weatherBox');
    final cachedData = box.get('weatherData');

    if (cachedData != null) {
     
      return WeatherModel.fromApi(Map<String, dynamic>.from(cachedData));
    }
    return null;
  }

}