import 'package:get/get.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/api_service.dart';

class WeatherController extends GetxController {
  final weatherDetail = Rx<WeatherModel?>(null);
  final isLoading = false.obs;
  final isOffline = false.obs;

  final ApiService _apiService = ApiService();

  @override
  onInit() {
    super.onInit();
    fetchWeatherDetails();
  }

  Future<void> fetchWeatherDetails() async {
    isLoading.value = true;

    try {
      
      final detail = await _apiService.fetchWeatherData();
      weatherDetail.value = detail;
      isOffline.value = false; // Online mode
    } catch (e) {
      // Use cached data if API fails
      final cachedDetail = _apiService.getCachedWeatherData();
      if (cachedDetail != null) {
        weatherDetail.value = cachedDetail;
        isOffline.value = true; // Offline mode
      }
    } finally {
      isLoading.value = false;
    }
  }
}
