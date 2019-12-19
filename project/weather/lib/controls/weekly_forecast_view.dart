import 'package:flutter/material.dart';
import 'package:weather_app/controls/weather_row_view.dart';

abstract class WeeklyForecastViewModel {
  List<WeatherRow> rows;
}

class WeeklyForecastView extends StatelessWidget {
  final WeeklyForecastViewModel viewModel;
  final double padding = 16;

  WeeklyForecastView({this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: padding, right: padding),
      child: Column(
          children: viewModel.rows.map((row) {
        return WeatherRowView(row);
      }).toList()),
    );
  }
}
