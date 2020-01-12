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

    forecasts = [];
    for (var index = 0; index < cities.length; index++) {
      var weatherList = weathers[index];
      var city = cities[index];
      var weather = weatherList.first;
      var day = DateFormat('EEEE').format(weather.date);
      var infoViewModel = WeatherInfoViewModel(
          title: "${city.name}, ${city.country}",
          subTitle: weather.weatherMain,
          heading: "${weather.temperature.celsius.toInt()}˚");
      var currentTemp = WeatherTextualRowImp(
          day: day,
          maxTemp: "${weather.tempMax.celsius.toInt()}",
          minTemp: "${weather.tempMin.celsius.toInt()}",
          text: "TODAY");
      var dailyForecastViewModel = DailyForecastViewModelImp(
          columns: weatherList.map((weather) {
        return WeatherColumnImp(
            bottomText: "${weather.tempMin.celsius.toInt()}",
            topText: "${weather.tempMax.celsius.toInt()}",
            icon: "http://openweathermap.org/img/wn/${weather.weatherIcon}.png");
      }).toList());
      var weeklyForecastViewModel = WeeklyForecastViewModelImp(
          rows: weatherList.map((weather) {
        var day = DateFormat('EEEE').format(weather.date);
        return WeatherRowImp(
            day: day,
            maxTemp: "${weather.tempMax.celsius.toInt()}",
            minTemp: "${weather.tempMin.celsius.toInt()}",
            icon: "http://openweathermap.org/img/wn/${weather.weatherIcon}.png");
      }).toList());
      forecasts.add(WeatherForecastViewModel(
          infoViewModel: infoViewModel,
          currentTemp: currentTemp,
          dailyForecastViewModel: dailyForecastViewModel,
          weeklyForecastViewModel: weeklyForecastViewModel));
    }

    if (reloadData != null) {
      reloadData();
    }
  }
}