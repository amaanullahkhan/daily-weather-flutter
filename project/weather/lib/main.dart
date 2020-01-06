import 'package:flutter/material.dart';
import 'package:weather_app/app_dependency_container.dart';
import 'package:weather_app/persistence/database_manager.dart';
import 'modules/forecasts/forecasts_view/forecasts_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseManager.shared.openDB();
  runApp(WeatherApp(weatherAppFactory: AppDependencyContainer()));
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
