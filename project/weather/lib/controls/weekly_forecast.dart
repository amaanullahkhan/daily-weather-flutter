import 'package:flutter/material.dart';
import 'weather_row.dart';

class WeeklyForecast extends StatelessWidget {
  final List<WeatherRow> rows;
  final double padding = 16;

  WeeklyForecast({this.rows});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: padding, right: padding),
      child: Column(
        children: rows,
      ),
    );
  }
}
