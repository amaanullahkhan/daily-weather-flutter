import 'package:weather_app/modules/forecast/forecast_view/forecast_view_model.dart';
import 'package:weather_app/modules/forecasts/forecasts_service/forecasts_service.dart';
import 'package:weather_app/modules/forecasts/forecasts_view/forecasts_view_model.dart';

class WeatherForecastsViewModel implements ForecastsViewModel {
  
  @override
  List<ForecastViewModel> forecasts;

  @override
  ForecastsService service;

  WeatherForecastsViewModel({this.forecasts, this.service});
}
