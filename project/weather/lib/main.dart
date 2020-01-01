import 'package:flutter/material.dart';
import 'package:weather_app/app_dependency_container.dart';
import 'package:weather_app/modules/forecasts/forecasts_service/forecasts_service.dart';
import 'modules/forecasts/forecasts_view/forecasts_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(WeatherApp(weatherAppFactory: AppDependencyContainer()));
  var service = ForecastsService();
  var weather  = await service.forecastOf('1172451');
  print(weather);
}

class WeatherApp extends StatelessWidget {
  final WeatherAppFactory weatherAppFactory;

  WeatherApp({@required this.weatherAppFactory});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: weatherAppFactory.makeForecastsView());
  }
}

abstract class WeatherAppFactory {
  ForecastsView makeForecastsView();
}
