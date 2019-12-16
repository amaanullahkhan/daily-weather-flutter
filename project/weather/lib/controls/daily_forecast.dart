import 'package:flutter/material.dart';
import 'weather_column.dart';

class DailyForecast extends StatelessWidget {
  final List<WeatherColumn> columns;
  final double padding = 16;

  DailyForecast({this.columns});

  @override
  Widget build(BuildContext context) {
    var children = columns.map((column) {
      return Container(child: column, padding: EdgeInsets.all(padding));
    }).toList();
    return Row(children: children);
  }
}
