import 'package:weather_app/main.dart';
import 'package:weather_app/modules/forecasts/forecasts_service/forecasts_service.dart';
import 'package:weather_app/modules/forecasts/forecasts_view/forecasts_view.dart';
import 'package:weather_app/modules/forecasts/forecasts_view_model/weather_forecasts_view_model.dart';
import 'package:weather_app/modules/forecasts_map/forecasts_map_view.dart';
import 'package:weather_app/modules/locations/location_data_provider.dart';
import 'package:weather_app/modules/locations/location_repository.dart';
import 'package:weather_app/modules/locations/location_view/location_view.dart';
import 'package:weather_app/modules/locations/location_view_model/location_view_model.dart';
import 'package:weather_app/persistence/database_manager.dart';
import 'modules/forecasts/forecasts_view/forecasts_view_model.dart';

class AppDependencyContainer implements WeatherAppFactory, ForecastsViewFactory {
  @override
  ForecastsView makeForecastsView() {
    return ForecastsView(viewModel: makeForecastsViewModel(), forecastsViewFactory: this);
  }

  ForecastsViewModel makeForecastsViewModel() {
    var dbManager = DatabaseManager.shared;
    var repository = LocationRepository(dbManager);
    var service = ForecastsService();
    var viewModel = WeatherForecastsViewModel(service, repository);
    return viewModel;
  }

  @override
  LocationView makeLocationView(LocationViewModelProtocol delegate) {
    var dataProvider = LocationsDataProvider();
    var viewModel = LocationViewModel(dataProvider, delegate, "Select Location");
    return LocationView(viewModel);
  }

  @override
  ForecastsMap makeForecastsMap() {
    return ForecastsMap();
  }

  
}
