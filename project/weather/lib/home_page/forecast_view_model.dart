import 'package:weather_app/controls/daily_forecast_view.dart';
import 'package:weather_app/controls/weather_textual_row.dart';
import 'package:weather_app/controls/weekly_forecast_view.dart';

abstract class ForecastViewModel {
  InfoViewModel infoViewModel;
  WeatherTextualRow currentTemp;
  DailyForecastViewModel dailyForecastViewModel;
  WeeklyForecastViewModel weeklyForecastViewModel;
}

abstract class InfoViewModel {
  String get title;
  String get subTitle;
  String get heading;
}








