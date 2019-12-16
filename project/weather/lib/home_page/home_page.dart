import 'package:flutter/material.dart';
import 'package:weather/controls/daily_forecast.dart';
import 'package:weather/controls/weather_column.dart';
import 'package:weather/controls/weather_row.dart';
import 'package:weather/controls/weekly_forecast.dart';
import 'package:weather/controls/primary_text.dart';

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
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      DailyForecast(
                        columns: [
                          WeatherColumn(
                            bottomText: "32˚",
                            icon: Icon(Icons.cloud),
                            topText: "3PM",
                          ),
                          WeatherColumn(
                            bottomText: "32˚",
                            icon: Icon(Icons.cloud),
                            topText: "3PM",
                          ),
                          WeatherColumn(
                            bottomText: "32˚",
                            icon: Icon(Icons.cloud),
                            topText: "3PM",
                          )
                        ],
                      )
                    ],
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
                      icon: Icon(Icons.cloud, color: Colors.white),
                    ),
                    WeatherRow(
                      day: "Thursday",
                      maxTemp: "32",
                      minTemp: "24",
                      icon: Icon(Icons.cloud, color: Colors.white),
                    ),
                    WeatherRow(
                      day: "Thursday",
                      maxTemp: "32",
                      minTemp: "24",
                      icon: Icon(Icons.cloud, color: Colors.white),
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
