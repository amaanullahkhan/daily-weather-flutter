import 'package:flutter/material.dart';
import 'package:weather_app/controls/daily_forecast_view.dart';
import 'package:weather_app/controls/primary_text.dart';
import 'package:weather_app/controls/weather_textual_row.dart';
import 'package:weather_app/controls/weekly_forecast_view.dart';
import 'package:weather_app/home_page/forecast_view_model.dart';

class ForecastView extends StatelessWidget {
  final ForecastViewModel viewModel;

  ForecastView({this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[300],
      body: Container(
        child: ListView(
          children: <Widget>[
            infoHeader,
            todayForecast,
            dailyForecast,
            weeklyForecast,
          ],
        ),
      ),
    );
  }

  Widget get dailyForecast {
    var _dailyForecast =
        DailyForecastView(viewModel: viewModel.dailyForecastViewModel);

    return Column(children: <Widget>[
      Container(
        height: 1,
        color: Colors.white60,
      ),
      Container(
        height: 140,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [_dailyForecast],
        ),
      ),
      Container(
        height: 1,
        color: Colors.white60,
      ),
      SizedBox(
        height: 5,
      )
    ]);
  }

  Widget get infoHeader {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 100,
        ),
        PrimaryText(
          viewModel.infoViewModel.title,
          fontSize: 35,
        ),
        PrimaryText(
          viewModel.infoViewModel.subTitle,
          fontSize: 17,
        ),
        SizedBox(
          height: 10,
        ),
        PrimaryText(
          viewModel.infoViewModel.heading,
          fontSize: 70,
        ),
        SizedBox(
          height: 50,
        ),
      ],
    );
  }

  Widget get todayForecast {
    return Container(
        padding: EdgeInsets.all(16),
        child: WeatherTextualRowView(textualRow: viewModel.currentTemp));
  }

  WeeklyForecastView get weeklyForecast {
    return WeeklyForecastView(
      viewModel: viewModel.weeklyForecastViewModel,
    );
  }
}
