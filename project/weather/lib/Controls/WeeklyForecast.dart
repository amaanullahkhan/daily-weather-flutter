import 'package:flutter/material.dart';
import 'WeatherRow.dart';

class WeeklyForecast extends StatelessWidget {
  
  final List<WeatherRow> rows;

  WeeklyForecast({this.rows});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      child: Column(
        children: rows,
      ),
    );
  }
}