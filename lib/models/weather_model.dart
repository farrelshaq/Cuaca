class WeatherModel {
  final String cityName;
  final double temperature;
  final String description;
  final String iconUrl;
  final String country;
  final double humidity;
  final double windSpeed;
  final int sunrise;

  WeatherModel({
    required this.cityName,
    required this.temperature,
    required this.description,
    required this.iconUrl,
    required this.country,
    required this.humidity,
    required this.windSpeed,
    required this.sunrise,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['name'] ?? '',
      temperature: (json['main']['temp'] as num).toDouble(),
      description: json['weather'][0]['description'] ?? '',
      iconUrl: "http://openweathermap.org/img/wn/${json['weather'][0]['icon']}@2x.png",
      country: json['sys']['country'] ?? '',
      humidity: (json['main']['humidity'] as num).toDouble(),
      windSpeed: (json['wind']['speed'] as num).toDouble(),
      sunrise: json['sys']['sunrise'] ?? 0,
    );
  }
}
  