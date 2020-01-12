import 'package:weather_app/main.dart';
import 'package:weather_app/modules/forecasts/forecasts_service/forecasts_service.dart';
import 'package:weather_app/modules/forecasts/forecasts_view/forecasts_view.dart';
import 'package:weather_app/modules/forecasts/forecasts_view_model/weather_forecasts_view_model.dart';
import 'package:weather_app/modules/locations/location_data_provider.dart';
import 'package:weather_app/modules/locations/location_repository.dart';
import 'package:weather_app/modules/locations/location_view/location_view.dart';
import 'package:weather_app/modules/locations/location_view_model/location_view_model.dart';
import 'package:weather_app/persistence/database_manager.dart';
import 'modules/forecast/forecast_view/forecast_view.dart';
import 'modules/forecast/forecast_view/forecast_view_model.dart';
import 'modules/forecast/forecast_view_model/weather_forecast_view_model.dart';
import 'modules/forecasts/forecasts_view/forecasts_view_model.dart';

class AppDependencyContainer implements WeatherAppFactory, ForecastsViewFactory {
  @override
  ForecastsView makeForecastsView() {
    return ForecastsView(viewModel: makeForecastsViewModel(), forecastsViewFactory: this);
  }

  ForecastView makeForecastView() {
    var forecastView = ForecastView(viewModel: makeForecastViewModel());
    return forecastView;
  }

  ForecastViewModel makeForecastViewModel() {
    var forecastViewModel = WeatherForecastViewModel(
        infoViewModel: WeatherInfoViewModel(
          title: "Karachi",
          subTitle: "Mostly cloudy",
          heading: "32˚",
        ),
        currentTemp: WeatherTextualRowImp(
            day: "Wednesday", maxTemp: "32", minTemp: "23", text: "TODAY"),
        dailyForecastViewModel: DailyForecastViewModelImp(columns: [
          WeatherColumnImp(topText: "32", bottomText: "23", icon: "cloud")
        ]),
        weeklyForecastViewModel: WeeklyForecastViewModelImp(rows: [
          WeatherRowImp(
              day: "Wednesday", icon: "cloud", maxTemp: "32", minTemp: "23")
        ]));
    return forecastViewModel;
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
}
