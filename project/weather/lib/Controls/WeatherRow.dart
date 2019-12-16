import 'package:flutter/material.dart';
import 'package:weather/Controls/PrimaryText.dart';

class WeatherRow extends StatelessWidget {
  final String day;
  final String maxTemp;
  final String minTemp;
  final Icon icon;

  WeatherRow({this.day, this.maxTemp, this.minTemp, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          PrimaryText(this.day),
          Expanded(
            child: SizedBox.shrink(),
          ),
          icon,
          Expanded(
            child: SizedBox.shrink(),
          ),
          PrimaryText(this.maxTemp),
          SizedBox(
            width: 40,
          ),
          PrimaryText(this.minTemp),
        ],
      ),
    );
  }
}