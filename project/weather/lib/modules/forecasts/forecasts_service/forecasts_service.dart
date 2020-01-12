import 'package:dio/dio.dart';
import 'package:weather/weather.dart';

class ForecastsService {
  final Dio dio = Dio();

  Future<List<List<Weather>>> forecastsOf(List<String> cities) async {
    var responses = await [
      for (var i = 0; i < cities.length; i++)
        dio.get(
            'https://api.openweathermap.org/data/2.5/forecast?id=${cities[i]}&appid=ae0027368366977769d812a219b6e19e')
    ];
    List<List<Weather>> forecasts = [];
    for (var _response in responses) {
      var response = await _response;
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonForecasts = response.data;
        List<dynamic> forecastsJson = jsonForecasts['list'];
        forecasts.add(forecastsJson.map((weatherJson) {
          var weather = Weather(weatherJson);
          return weather;
        }).toList());
      } else {
        forecasts.add([]);
      }
    }
    return forecasts;
  }

  Future<Map<String, dynamic>> currentWeatherOf(String lat, String long) async {
    var response = await dio
        .get('api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long');
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonForecasts = response.data;
      return jsonForecasts;
    } else {
      return {};
    }
  }
}
