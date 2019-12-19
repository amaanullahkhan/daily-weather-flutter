import 'package:flutter/material.dart';
import 'package:weather_app/controls/primary_text.dart';


abstract class WeatherRow {
  String get day;
  String get icon;
  String get maxTemp;
  String get minTemp;
}


class WeatherRowView extends StatelessWidget {
  
  final WeatherRow row;

  WeatherRowView(this.row);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          PrimaryText(row.day),
          Expanded(
            child: SizedBox.shrink(),
          ),
          PrimaryText(row.icon),
          Expanded(
            child: SizedBox.shrink(),
          ),
          PrimaryText(row.maxTemp),
          SizedBox(
            width: 40,
          ),
          PrimaryText(row.maxTemp),
        ],
      ),
    );
  }
}
