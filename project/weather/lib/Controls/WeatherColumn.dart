import 'package:flutter/material.dart';
import 'PrimaryText.dart';

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
        PrimaryText(this.topText),
        IconTheme(
          data: IconThemeData(color: Colors.white),
          child: icon,
        ),
        PrimaryText(this.bottomText),
      ],
    );
  }
}