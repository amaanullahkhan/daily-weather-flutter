import 'package:dio/dio.dart';
import 'package:weather/weather.dart';

class ForecastService {
  
  final Dio dio = Dio();

  Future<List<Weather>> forecastOf(String cityId) async {
    var url =
        'https://api.openweathermap.org/data/2.5/forecast?id=$cityId&appid=ae0027368366977769d812a219b6e19e';
    List<Weather> forecasts = [];
    Response<Map<String, dynamic>> response = await dio.get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonForecasts = await response.data;
      List<dynamic> forecastsJson = jsonForecasts['list'];
      forecasts = forecastsJson.map((w) => Weather(w)).toList();
    }

    return forecasts;
  }
}
