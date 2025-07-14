class WeatherApi {
  static const String _baseUrl = 'https://api.openweathermap.org/data/3.0/onecall';
  static const String _apiKey = 'd3f405d8602bd54eb36374f48b28344c';

  static String getWeatherUrl({
    required double lat,
    required double lon,
    String exclude = 'minutely,hourly,alerts',
    String units = 'metric',
  }) {
    return '$_baseUrl?lat=$lat&lon=$lon&exclude=$exclude&units=$units&appid=$_apiKey';
  }
}
