import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/weather_model.dart';

class DetailWeatherPage extends StatelessWidget {
  final WeatherModel weather;

  const DetailWeatherPage({Key? key, required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sunriseDateTime = DateTime.fromMillisecondsSinceEpoch(
      weather.sunrise * 1000,
      isUtc: true,
    ).toLocal();

    final sunriseTime = DateFormat('hh:mm a').format(sunriseDateTime);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 206, 223, 250), // 🔑 ini bikin background abu-abu muda
      appBar: AppBar(
        title: Text('${weather.cityName}, ${weather.country}'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Text(
                '${weather.temperature.toStringAsFixed(1)}°C',
                style: const TextStyle(
                  fontSize: 64,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                weather.description,
                style: const TextStyle(
                  fontSize: 24,
                  color: Color.fromARGB(255, 126, 126, 126),
                ),
              ),
              const SizedBox(height: 24),
              Image.network(
                weather.iconUrl,
                scale: 0.8,
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _InfoTile(
                    icon: Icons.water_drop,
                    label: 'Humidity',
                    value: '${weather.humidity}%',
                  ),
                  _InfoTile(
                    icon: Icons.air,
                    label: 'Wind',
                    value: '${weather.windSpeed} m/s',
                  ),
                  _InfoTile(
                    icon: Icons.wb_sunny,
                    label: 'Sunrise',
                    value: sunriseTime,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoTile({
    Key? key,
    required this.icon,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 28, color: Colors.blueAccent),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        Text(
          value,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
