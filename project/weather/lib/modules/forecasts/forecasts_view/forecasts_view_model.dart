import 'package:weather_app/modules/forecast/forecast_view/forecast_view_model.dart';
import 'package:weather_app/modules/forecasts/forecasts_service/forecasts_service.dart';
import 'package:weather_app/modules/locations/location_repository.dart';
import 'package:weather_app/modules/locations/location_view_model/location_view_model.dart';

abstract class ForecastsViewModel implements LocationViewModelProtocol {
  ForecastsService service;
  List<ForecastViewModel> forecasts;
  LocationRepository locationRepository;

  Function() reloadData;

  void fetchData();
}
