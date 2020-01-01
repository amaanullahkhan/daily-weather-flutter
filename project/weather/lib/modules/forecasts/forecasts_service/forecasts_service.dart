import 'package:dio/dio.dart';
import 'package:weather/weather.dart';

class ForecastsService {
  final Dio dio = Dio();

  Future<List<Weather>> forecastOf(String cityId) async {
    var url =
        'https://api.openweathermap.org/data/2.5/forecast?id=$cityId&appid=ae0027368366977769d812a219b6e19e';
    List<Weather> forecasts = [];
    Response<Map<String, dynamic>> response = await dio.get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonForecasts = response.data;
      List<dynamic> forecastsJson = jsonForecasts['list'];
      forecasts = forecastsJson.map((w) => Weather(w)).toList();
    }
    return forecasts;
  }

  Future<List<List<Weather>>> forecastsOf(List<String> cities) async {
    var responses = await Future.wait([dio.get(
          'https://api.openweathermap.org/data/2.5/forecast?id=${cities[0]}&appid=ae0027368366977769d812a219b6e19e'),
          dio.get(
          'https://api.openweathermap.org/data/2.5/forecast?id=${cities[1]}&appid=ae0027368366977769d812a219b6e19e')]);
    List<List<Weather>> forecasts = [];
    responses.map((response) {
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonForecasts = response.data;
        List<dynamic> forecastsJson = jsonForecasts['list'];
        forecasts.add(forecastsJson.map((w) => Weather(w)).toList());
      } else {
        forecasts.add([]);
      }
    });

    return forecasts;
  }
}
