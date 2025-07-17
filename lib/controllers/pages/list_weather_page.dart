import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/weather_model.dart';
import 'detail_weather_page.dart';

class ListWeatherPage extends StatefulWidget {
  const ListWeatherPage({Key? key}) : super(key: key);

  @override
  State<ListWeatherPage> createState() => _ListWeatherPageState();
}

class _ListWeatherPageState extends State<ListWeatherPage> {
  List<WeatherModel> weathers = [];
  final List<String> cities = ["Jakarta", "Bandung", "Sidoarjo", "Malang", "Bali"];
  final String apiKey = "719c265d4a9ccf10506442f384482f07";

  @override
  void initState() {
    super.initState();
    fetchWeatherData();
  }

  Future<void> fetchWeatherData() async {
    List<WeatherModel> tempList = [];

    for (String city in cities) {
      final url =
          "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric";

      try {
        final response = await http.get(Uri.parse(url));
        if (response.statusCode == 200) {
          final data = json.decode(response.body);
          final model = WeatherModel(
            cityName: data['name'],
            temperature: data['main']['temp'].toDouble(),
            description: data['weather'][0]['description'],
            iconUrl: "http://openweathermap.org/img/wn/${data['weather'][0]['icon']}@2x.png",
            country: data['sys']['country'],
            humidity: data['main']['humidity'].toDouble(),
            windSpeed: data['wind']['speed'].toDouble(),
            sunrise: data['sys']['sunrise'],
          );
          tempList.add(model);
        }
      } catch (e) {
        print("Error fetching data for $city: $e");
      }
    }

    setState(() {
      weathers = tempList;
    });
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
      appBar: AppBar(
        title: const Text("List Weather",
            style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
        backgroundColor: const Color.fromARGB(172, 7, 7, 7),
      ),
      backgroundColor: const Color.fromRGBO(175, 196, 216, 1),
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
