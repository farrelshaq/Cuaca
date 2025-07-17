class WeatherApi {
  static String _apiKey = 'd3f405d8602bd54eb36374f48b28344c'; 

  static String getWeatherUrl({
    required double lat,
    required double lon,
    String exclude = 'minutely,hourly,alerts',
    String units = 'metric',
  }) {
    return 'https://api.openweathermap.org/data/2.5/weather'
           '?lat=$lat&lon=$lon&units=metric&appid=$_apiKey';
  }
}
