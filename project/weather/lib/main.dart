import 'package:flutter/material.dart';
import 'package:weather_app/app_dependency_container.dart';
import 'home_page/forecast_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(WeatherApp(weatherAppFactory: AppDependencyContainer()));
}

class WeatherApp extends StatelessWidget {
  final WeatherAppFactory weatherAppFactory;

  WeatherApp({@required this.weatherAppFactory});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: weatherAppFactory.makeForecastView());
  }
}

abstract class WeatherAppFactory {
  ForecastView makeForecastView();
}
