import 'package:weather_app/modules/forecast/forecast_view/forecast_view_model.dart';
import 'package:weather_app/modules/forecasts/forecasts_service/forecasts_service.dart';

abstract class ForecastsViewModel {
  ForecastsService service;
  List<ForecastViewModel> forecasts;
}