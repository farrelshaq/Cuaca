import 'package:cuaca/controllers/pages/list_weather_page.dart';
import 'package:cuaca/home_page.dart';
import 'package:flutter/material.dart';
 // pastikan file list.dart ada di folder lib

void main() {
  runApp(const MyApp());
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
