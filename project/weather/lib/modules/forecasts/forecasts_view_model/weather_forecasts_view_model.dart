
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

      var forecastViewModel =
          WeatherForecastViewModel.fromWeather(weatherList, city);
      forecastViewModel.onRemoveTapped = () async {
        var city = cities[index];
        await locationRepository.deleteCity(city);
        fetchData();
      };

      forecasts.add(forecastViewModel);
    }

    if (reloadData != null) {
      reloadData();
    }
  }
}
