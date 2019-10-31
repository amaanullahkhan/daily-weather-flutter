import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[300],
      body: Container(
        child: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 100,
                ),
                PrimaryText(
                  "Karachi",
                  fontSize: 35,
                ),
                PrimaryText(
                  "Mostly Cloudy",
                  fontSize: 17,
                ),
                SizedBox(
                  height: 10,
                ),
                PrimaryText(
                  "32˚",
                  fontSize: 70,
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    children: <Widget>[
                      PrimaryText("Wednesday"),
                      SizedBox(
                        width: 10,
                      ),
                      PrimaryText(
                        "TODAY",
                        fontSize: 20,
                      ),
                      Expanded(
                        child: SizedBox.shrink(),
                      ),
                      PrimaryText("32"),
                      SizedBox(
                        width: 10,
                      ),
                      PrimaryText("24"),
                    ],
                  ),
                ),
                Container(
                  height: 1,
                  color: Colors.white60,
                ),
                Container(
                  height: 140,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding: EdgeInsets.all(16),
                        child: WeatherColumn(
                          bottomText: "32˚",
                          topText: "3PM",
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  height: 1,
                  color: Colors.white60,
                ),
                SizedBox(
                  height: 5,
                ),
                WeeklyForecast(
                  rows: <WeatherRow>[
                    WeatherRow(
                      day: "Thursday",
                      maxTemp: "32",
                      minTemp: "24",
                    ),
                    WeatherRow(
                      day: "Thursday",
                      maxTemp: "32",
                      minTemp: "24",
                    ),
                    WeatherRow(
                      day: "Thursday",
                      maxTemp: "32",
                      minTemp: "24",
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PrimaryText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;

  PrimaryText(this.text, {this.color = Colors.white, this.fontSize = 23});

  @override
  Widget build(BuildContext context) {
    return Text(
      this.text,
      style: TextStyle(color: this.color, fontSize: this.fontSize),
    );
  }
}

class WeatherColumn extends StatelessWidget {
  final String topText;
  final String bottomText;

  WeatherColumn({this.topText, this.bottomText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        PrimaryText(this.topText),
        PrimaryText(this.bottomText),
      ],
    );
  }
}

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

class WeatherRow extends StatelessWidget {
  final String day;
  final String maxTemp;
  final String minTemp;

  WeatherRow({this.day, this.maxTemp, this.minTemp});

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
