import 'package:intl/intl.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/models/city.dart';
import 'package:weather_app/modules/forecast/forecast_view/forecast_view_model.dart';
import 'package:weather_app/modules/forecast/forecast_view_model/weather_forecast_view_model.dart';
import 'package:weather_app/modules/forecasts/forecasts_service/forecasts_service.dart';
import 'package:weather_app/modules/forecasts/forecasts_view/forecasts_view_model.dart';
import 'package:weather_app/modules/locations/location_repository.dart';
import 'package:weather_app/modules/locations/location_view_model/location_view_model.dart';

class WeatherForecastsViewModel implements ForecastsViewModel {
  @override
  List<ForecastViewModel> forecasts = [];

  @override
  ForecastsService service;

  WeatherForecastsViewModel(this.service, this.locationRepository);

  @override
  LocationRepository locationRepository;

  @override
  Function() reloadData;

  @override
  Future<void> locationViewModel(
      LocationViewModel viewModel, City selectedCity) async {
    await locationRepository.insertCity(selectedCity);
    await fetchData();
  }

  @override
  void fetchData() async {
    var cities = await locationRepository.cities();
    var weathers = await service.forecastsOf(cities.map((city) {
      return "${city.id}";
    }).toList());

    forecasts = [];
    for (var index = 0; index < cities.length; index++) {
      var weatherList = weathers[index];
      var city = cities[index];
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

      forecasts.add(WeatherForecastViewModel(
          infoViewModel: infoViewModel,
          currentTemp: currentTemp,
          dailyForecastViewModel: dailyForecastViewModel,
          weeklyForecastViewModel: weeklyForecastViewModel,
          onRemoveTapped: () async {
            var city = cities[index];
            await locationRepository.deleteCity(city);
            fetchData();
          }));
    }

    if (reloadData != null) {
      reloadData();
    }
  }
}
