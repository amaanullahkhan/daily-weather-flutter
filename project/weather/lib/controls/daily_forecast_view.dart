import 'package:flutter/material.dart';
import 'package:weather_app/controls/weather_column_view.dart';

abstract class DailyForecastViewModel {
  List<WeatherColumn> columns;
}

class DailyForecastView extends StatelessWidget {
  final DailyForecastViewModel viewModel;
  final double padding = 16;

  DailyForecastView({this.viewModel});

  @override
  Widget build(BuildContext context) {
    var children = viewModel.columns.map((column) {
      return Container(
          child: WeatherColumnView(column: column),
          padding: EdgeInsets.all(padding));
    }).toList();
    return Row(children: children);
  }
}
