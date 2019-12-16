import 'package:flutter/material.dart';
import 'primary_text.dart';

class WeatherColumn extends StatelessWidget {
  final String topText;
  final String bottomText;
  final Icon icon;

  WeatherColumn({this.topText, this.bottomText, this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        PrimaryText(topText),
        IconTheme(
          data: IconThemeData(color: Colors.white),
          child: icon,
        ),
        PrimaryText(bottomText),
      ],
    );
  }
}