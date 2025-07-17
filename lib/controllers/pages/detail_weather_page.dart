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
    final sunriseTime = DateFormat('HH:mm').format(sunriseDateTime);
    final currentTime = DateFormat('EEEE hh:mm a').format(DateTime.now());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Back to List Weather",
            style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
        backgroundColor: const Color.fromARGB(172, 7, 7, 7),
      ),
      backgroundColor: const Color.fromARGB(255, 220, 238, 255),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              Text(
                weather.cityName,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                currentTime,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 32),
              Image.network(
                weather.iconUrl,
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 24),
              Text(
                '${weather.temperature.toStringAsFixed(0)}°C',
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Good Morning, ${weather.userName ?? "User"}',
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _BottomInfo(
                    icon: Icons.wb_sunny_outlined,
                    label: 'Sunrise',
                    value: sunriseTime,
                  ),
                  _BottomInfo(
                    icon: Icons.air,
                    label: 'Wind',
                    value: '${weather.windSpeed} m/s',
                  ),
                  _BottomInfo(
                    icon: Icons.thermostat,
                    label: 'Temp',
                    value: '${weather.temperature.toStringAsFixed(0)}°',
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

class _BottomInfo extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _BottomInfo({
    Key? key,
    required this.icon,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 28, color: const Color.fromARGB(255, 76, 151, 255)),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
        Text(
          value,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
