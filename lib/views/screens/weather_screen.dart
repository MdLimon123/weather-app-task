import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller/weather_controller.dart';

class WeatherScreen extends StatelessWidget {
  WeatherScreen({Key? key}) : super(key: key);

  final WeatherController controller = Get.put(WeatherController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(
              controller.isOffline.value
                  ? 'Weather (Offline)'
                  : 'Weather Information',
            )),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final weather = controller.weatherDetail.value;

        if (weather == null) {
          return const Center(child: Text('No weather data available.'));
        }

        return ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            Center(
              child: Text(
                weather.cityName,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                weather.description,
                style: const TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.thermostat_outlined),
              title: const Text(
                'Temperature',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              subtitle: Text(weather.temperature,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w400)),
            ),
            ListTile(
              leading: const Icon(Icons.thermostat),
              title: const Text('Feels Like',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
              subtitle: Text(weather.feelsLike,
              style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w400)),
            ),
            ListTile(
              leading: const Icon(Icons.air),
              title: const Text('Wind Speed',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              
              subtitle: Text(weather.windSpeed,
               style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w400)),
            ),
            ListTile(
              leading: const Icon(Icons.water_drop),
              title: const Text('Humidity',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
              subtitle: Text(weather.humidity,
              style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w400)),
            ),
          ],
        );
      }),
    );
  }
}
