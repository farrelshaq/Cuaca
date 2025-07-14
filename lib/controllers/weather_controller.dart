import '../services/weather_api.dart';

class WeatherController {
  void fetchWeather(double lat, double lon) {
    final url = Uri.parse(
      WeatherApi.getWeatherUrl(lat: lat, lon: lon),
    );

    print('API URL: $url');
  }
}
