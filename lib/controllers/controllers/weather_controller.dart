import 'dart:convert';
import 'package:cuaca/services/weather_api.dart';
import 'package:http/http.dart' as http;
import '../models/weather_model.dart';
import '../services/weather_api.dart';

class WeatherController {
  Future<WeatherModel> fetchWeather() async {
    double lat = -7.98; // Contoh Malang
    double lon = 112.63;

    final url = Uri.parse(
      WeatherApi.getWeatherUrl(lat: lat, lon: lon),
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);

      /// ⏩ PAKAI INI SAJA, OTOMATIS
      return WeatherModel.fromJson(jsonData);
    } else {
      throw Exception('Failed to load weather');
    }
  }
  
}
