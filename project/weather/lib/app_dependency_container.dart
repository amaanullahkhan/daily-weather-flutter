import 'package:weather_app/main.dart';
import 'package:weather_app/modules/forecasts/forecasts_view/forecasts_view.dart';
import 'package:weather_app/modules/forecasts/forecasts_view_model/weather_forecast_view_model.dart';
import 'modules/forecast/forecast_view/forecast_view.dart';
import 'modules/forecast/forecast_view/forecast_view_model.dart';
import 'modules/forecast/forecast_view_model/weather_forecast_view_model.dart';
import 'modules/forecasts/forecasts_view/forecasts_view_model.dart';

class AppDependencyContainer implements WeatherAppFactory {
  @override
  ForecastsView makeForecastsView() {
    return ForecastsView(viewModel: makeForecastsViewModel());
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
    var viewModel = WeatherForecastsViewModel(forecasts: [
      makeForecastViewModel(),
      makeForecastViewModel(),
      makeForecastViewModel()
    ]);
    return viewModel;
  }
}
