import 'dart:convert';
import 'package:cuaca/services/weather_api.dart';
import 'package:http/http.dart' as http;
import '../models/weather_model.dart';
import '../services/API/weather_api.dart';

Future<void> fetchWeather() async {
  const apiKey = '719c265d4a9ccf10506442f384482f07';
  const city = 'Jakarta';
  final url = Uri.parse(
    'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric',
  );

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    print("Suhu di $city: ${data['main']['temp']}°C");
    print("Cuaca: ${data['weather'][0]['description']}");
  } else {
    print("Gagal ambil data: ${response.statusCode}");
  }
}