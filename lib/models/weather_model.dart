class WeatherModel {
  final String cityName;
  final String temperature;
  final String feelsLike;
  final String humidity;
  final String windSpeed;
  final String description;


  WeatherModel({
    required this.cityName,
    required this.temperature,
    required this.feelsLike,
    required this.humidity,
    required this.windSpeed,
    required this.description,
    
  });

  factory WeatherModel.fromApi(Map<String, dynamic> data) {
    final weather = data['weather'][0];
    final main = data['main'];
    final wind = data['wind'];

    return WeatherModel(
      cityName: data['name'],
      temperature: '${main['temp']}°C',
      feelsLike: '${main['feels_like']}°C',
      humidity: '${main['humidity']}%',
      windSpeed: '${wind['speed']} m/s',
      description: weather['description'],
    );
  }
}
