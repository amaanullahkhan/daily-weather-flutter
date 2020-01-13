import 'package:intl/intl.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/controls/daily_forecast_view.dart';
import 'package:weather_app/controls/weather_column_view.dart';
import 'package:weather_app/controls/weather_row_view.dart';
import 'package:weather_app/controls/weather_textual_row.dart';
import 'package:weather_app/controls/weekly_forecast_view.dart';
import 'package:weather_app/models/city.dart';
import 'package:weather_app/modules/forecast/forecast_view/forecast_view_model.dart';

class WeatherForecastViewModel implements ForecastViewModel {
  InfoViewModel infoViewModel;
  WeatherTextualRow currentTemp;
  DailyForecastViewModel dailyForecastViewModel;
  WeeklyForecastViewModel weeklyForecastViewModel;

  Function() onRemoveTapped;

  WeatherForecastViewModel(
      {this.infoViewModel,
      this.currentTemp,
      this.dailyForecastViewModel,
      this.weeklyForecastViewModel,
      this.onRemoveTapped});

  factory WeatherForecastViewModel.fromWeather(
      List<Weather> weatherList, City city) {
    var weather = weatherList.first;

    var infoViewModel = WeatherInfoViewModel.fromWeather(weather, city);

    var currentTemp = WeatherTextualRowImp.fromWeather(weather, "TODAY");

    var todaysForecastList = weatherList.where((weather) {
      var today = DateTime.now();
      return today.day == weather.date.day &&
          today.month == weather.date.month &&
          today.year == weather.date.year;
    }).toList();

    var dailyForecastViewModel = DailyForecastViewModelImp(
        columns: todaysForecastList.map((weather) {
      return WeatherColumnImp.fromWeather(weather);
    }).toList());

    Map<int, Weather> weeklyForecastsList = {};
    for (var weather in weatherList) {
      weeklyForecastsList[weather.date.day] = weather;
    }

    var weeklyForecastViewModel = WeeklyForecastViewModelImp(
        rows: weeklyForecastsList.values.toList().map((weather) {
      return WeatherRowImp.fromWeather(weather);
    }).toList());

    return WeatherForecastViewModel(
        infoViewModel: infoViewModel,
        currentTemp: currentTemp,
        dailyForecastViewModel: dailyForecastViewModel,
        weeklyForecastViewModel: weeklyForecastViewModel);
  }

  @override
  void removeTapped() {
    if (onRemoveTapped != null) {
      onRemoveTapped();
    }
  }
}

class WeatherInfoViewModel implements InfoViewModel {
  String title;
  String subTitle;
  String heading;

  WeatherInfoViewModel({this.title, this.subTitle, this.heading});

  factory WeatherInfoViewModel.fromWeather(Weather weather, City city) {
    return WeatherInfoViewModel(
        title: "${city.name}, ${city.country}",
        subTitle: weather.weatherMain,
        heading: "${weather.temperature.celsius.toInt()}˚");
  }
}

class WeatherTextualRowImp implements WeatherTextualRow {
  String day;
  String text;
  String maxTemp;
  String minTemp;

  WeatherTextualRowImp({this.day, this.text, this.maxTemp, this.minTemp});

  factory WeatherTextualRowImp.fromWeather(Weather weather, String text) {
    return WeatherTextualRowImp(
        day: DateFormat('EEEE').format(weather.date),
        maxTemp: "${weather.temperature.celsius.toInt()}",
        minTemp: "${weather.tempMin.celsius.toInt()}",
        text: text);
  }
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

  factory WeatherColumnImp.fromWeather(Weather weather) {
    var time = DateFormat('ha').format(weather.date);
    return WeatherColumnImp(
        bottomText: "${weather.temperature.celsius.toInt()}",
        topText: time,
        icon: "http://openweathermap.org/img/wn/${weather.weatherIcon}.png");
  }
}

class WeatherRowImp implements WeatherRow {
  String day;
  String icon;
  String maxTemp;
  String minTemp;
  WeatherRowImp({this.day, this.icon, this.maxTemp, this.minTemp});

  factory WeatherRowImp.fromWeather(Weather weather) {
    return WeatherRowImp(
        day: DateFormat('EEEE').format(weather.date),
        maxTemp: "${weather.tempMax.celsius.toInt()}",
        minTemp: "${weather.tempMin.celsius.toInt()}",
        icon: "http://openweathermap.org/img/wn/${weather.weatherIcon}.png");
  }
}
