import 'package:flutter/material.dart';
import '../models/weather_model.dart';
import 'detail_weather_page.dart';

class ListWeatherPage extends StatefulWidget {
  const ListWeatherPage({Key? key}) : super(key: key);

  @override
  State<ListWeatherPage> createState() => _ListWeatherPageState();
}

class _ListWeatherPageState extends State<ListWeatherPage> {
  List<WeatherModel> weathers = [];

  @override
  void initState() {
    super.initState();
    // Dummy data sementara
    weathers = [
      WeatherModel(
        cityName: "Jakarta",
        temperature: 32,
        description: "Cerah",
        iconUrl: "http://openweathermap.org/img/wn/01d@2x.png",
        country: "ID",
        humidity: 70,
        windSpeed: 3.5,
        sunrise: 1715652091,
),
      WeatherModel(
        cityName: "Bandung",
        temperature: 24,
        description: "Berawan",
        iconUrl: "http://openweathermap.org/img/wn/02d@2x.png",
        country: "ID",
        humidity: 80,
        windSpeed: 2.0,
        sunrise: 1715652091, 
      ),
      WeatherModel(
        cityName: "Sidoarjo",
        temperature: 36,
        description: "Panas",
        iconUrl: "http://openweathermap.org/img/wn/01d@2x.png", 
        country: 'ID',
        humidity: 60,
        windSpeed: 4.0,
        sunrise: 1715652091,
      ),
      WeatherModel(
        cityName: "Malang",
        temperature: 19,
        description: "Sejuk",
        iconUrl: "http://openweathermap.org/img/wn/03d@2x.png", 
        country: 'ID',
        humidity: 50,
        windSpeed: 4.0,
        sunrise: 1715652091,
      ),
      WeatherModel(
        cityName: "Bali",
        temperature: 27,
        description: "Cerah Berawan",
        iconUrl: "http://openweathermap.org/img/wn/02d@2x.png",
        country: "ID",
        humidity: 76,
        windSpeed: 3.0,
        sunrise: 01,
      ),
    ];
  }

  Color getBackgroundColor(double temperature) {
    if (temperature < 20) {
      return const Color.fromARGB(255, 97, 117, 249);
    } else if (temperature >= 20 && temperature < 30) {
      return const Color.fromARGB(255, 116, 165, 255);
    } else if (temperature >= 30) {
      return const Color.fromARGB(255, 255, 145, 20);
    }
    return Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("List Weather")),
      body: weathers.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: weathers.length,
              itemBuilder: (context, index) {
                final weather = weathers[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailWeatherPage(weather: weather),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: getBackgroundColor(weather.temperature),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: Image.network(weather.iconUrl, width: 50),
                      title: Text("${weather.cityName}"),
                      subtitle: Text("${weather.description}"),
                      trailing: Text("${weather.temperature}°C"),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
