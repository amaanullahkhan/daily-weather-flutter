import 'package:weather_app/controls/daily_forecast_view.dart';
import 'package:weather_app/controls/weather_column_view.dart';
import 'package:weather_app/controls/weather_row_view.dart';
import 'package:weather_app/controls/weather_textual_row.dart';
import 'package:weather_app/controls/weekly_forecast_view.dart';
import 'forecast_view_model.dart';

class WeatherForecastViewModel implements ForecastViewModel {
  InfoViewModel infoViewModel;
  WeatherTextualRow currentTemp;
  DailyForecastViewModel dailyForecastViewModel;
  WeeklyForecastViewModel weeklyForecastViewModel;

  WeatherForecastViewModel(
      {this.infoViewModel,
      this.currentTemp,
      this.dailyForecastViewModel,
      this.weeklyForecastViewModel});
}

class WeatherInfoViewModel implements InfoViewModel {
  String title;
  String subTitle;
  String heading;

  WeatherInfoViewModel({this.title, this.subTitle, this.heading});
}

class WeatherTextualRowImp implements WeatherTextualRow {
  String day;
  String text;
  String maxTemp;
  String minTemp;

  WeatherTextualRowImp({this.day, this.text, this.maxTemp, this.minTemp});
}

class DailyForecastViewModelImp implements DailyForecastViewModel {
  @override
  List<WeatherColumn> columns;

  DailyForecastViewModelImp({this.columns});
}

class WeeklyForecastViewModelImp implements WeeklyForecastViewModel {
  @override
  List<WeatherRow> rows;

  WeeklyForecastViewModelImp({this.rows});
}

class WeatherColumnImp implements WeatherColumn {
  String topText;
  String bottomText;
  String icon;

  WeatherColumnImp({this.topText, this.bottomText, this.icon});
}

class WeatherRowImp implements WeatherRow {
  String day;
  String icon;
  String maxTemp;
  String minTemp;
  WeatherRowImp({this.day, this.icon, this.maxTemp, this.minTemp});
}
