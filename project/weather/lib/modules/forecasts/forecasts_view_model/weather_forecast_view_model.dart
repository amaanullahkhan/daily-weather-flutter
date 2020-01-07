import 'package:intl/intl.dart';
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

    forecasts = weathers.map((weatherList) {
      var weather = weatherList.first;
      var day = DateFormat('EEEE').format(weather.date);
      var infoViewModel = WeatherInfoViewModel(
          title: weather.areaName,
          subTitle: weather.weatherMain,
          heading: "${weather.temperature.celsius}");
      var currentTemp = WeatherTextualRowImp(
          day: day,
          maxTemp: "${weather.tempMax.celsius}",
          minTemp: "${weather.tempMin.celsius}",
          text: "TODAY");
      var dailyForecastViewModel = DailyForecastViewModelImp(
          columns: weatherList.map((weather) {
        return WeatherColumnImp(
            bottomText: "${weather.tempMin.celsius}",
            topText: "${weather.tempMax.celsius}",
            icon: "${weather.weatherIcon}");
      }).toList());
      var weeklyForecastViewModel = WeeklyForecastViewModelImp(
          rows: weatherList.map((weather) {
        var day = DateFormat('EEEE').format(weather.date);
        return WeatherRowImp(
            day: day,
            maxTemp: "${weather.tempMax.celsius}",
            minTemp: "${weather.tempMin.celsius}",
            icon: "${weather.weatherIcon}");
      }).toList());
      return WeatherForecastViewModel(
          infoViewModel: infoViewModel,
          currentTemp: currentTemp,
          dailyForecastViewModel: dailyForecastViewModel,
          weeklyForecastViewModel: weeklyForecastViewModel);
    }).toList();

    if (reloadData != null) {
      reloadData();
    }
  }
}
