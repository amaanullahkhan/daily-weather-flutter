import 'package:flutter/material.dart';
import 'package:weather_app/controls/primary_text.dart';

abstract class WeatherTextualRow {
  String get day;
  String get text;
  String get maxTemp;
  String get minTemp;
}


class WeatherTextualRowView extends StatelessWidget {
  final WeatherTextualRow textualRow;

  WeatherTextualRowView({this.textualRow});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        PrimaryText(textualRow.day),
        SizedBox(width: 10),
        PrimaryText(textualRow.text, fontSize: 18),
        Expanded(
          child: SizedBox.shrink(),
        ),
        PrimaryText(textualRow.maxTemp),
        SizedBox(
          width: 40,
        ),
        PrimaryText(textualRow.minTemp),
      ],
    );
  }
}
