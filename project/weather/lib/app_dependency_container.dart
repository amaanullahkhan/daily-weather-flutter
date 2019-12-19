import 'package:weather_app/home_page/forecast_view.dart';
import 'package:weather_app/home_page/forecast_view_model.dart';
import 'package:weather_app/home_page/weather_forecast_view_model.dart';
import 'package:weather_app/main.dart';

class AppDependencyContainer implements WeatherAppFactory {
  @override
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
}
