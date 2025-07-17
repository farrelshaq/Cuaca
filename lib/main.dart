import 'dart:convert';

import 'package:cuaca/controllers/pages/list_weather_page.dart';
import 'package:cuaca/home_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
 

void main() {
  runApp(const MyApp());
  Future<Album> fetchWeather() async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/onecall?lat=-7.98&lon=112.63&exclude=minutely&appid=d3f405d8602bd54eb36374f48b28344c&units=metric'));

    if (response.statusCode == 200) {
      return Album.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather');
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ListWeatherPage(), // pastikan widget pertama di sini
    );
  }
}

class Album {
  final int lat;
  final int lon;
  final String timezone;
  final String timezoneOffset;
  final String current;
  final String daily;
  final String hourly; 
  Album({
    required this.lat,
    required this.lon,
    required this.timezone,
    required this.timezoneOffset,
    required this.current,
    required this.daily,
    required this.hourly,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      lat: json['lat'],
      lon: json['lon'],
      timezone: json['timezone'],
      timezoneOffset: json['timezone_offset'],
      current: json['current'],
      daily: json['daily'],
      hourly: json['hourly'],
    );
  }
}
