import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/constants/string_constants.dart';
import 'home_page/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var weatherStation = WeatherStation(StringConstants.standard.openWeatherApiKey);
  var weather = await weatherStation.currentWeather();
  print(weather.toString());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
