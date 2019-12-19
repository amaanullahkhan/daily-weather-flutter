import 'package:flutter/material.dart';
import 'primary_text.dart';

abstract class WeatherColumn {
  String get topText;
  String get bottomText;
  String get icon;
}

class WeatherColumnView extends StatelessWidget {
  final WeatherColumn column;

  WeatherColumnView({this.column});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        PrimaryText(column.topText),
        PrimaryText(column.icon),
        PrimaryText(column.bottomText),
      ],
    );
  }
}
