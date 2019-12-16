import 'package:flutter/material.dart';

class PrimaryText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;

  PrimaryText(this.text, {this.color = Colors.white, this.fontSize = 23});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: fontSize),
    );
  }
}