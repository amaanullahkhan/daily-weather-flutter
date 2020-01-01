import 'package:flutter/material.dart';
import 'package:weather_app/modules/forecast/forecast_view/forecast_view.dart';
import 'package:weather_app/modules/forecasts/forecasts_view/forecasts_view_model.dart';

class ForecastsView extends StatefulWidget {
  final ForecastsViewModel viewModel;

  ForecastsView({this.viewModel});

  @override
  _ForecastsViewState createState() =>
      _ForecastsViewState(viewModel: viewModel);
}

class _ForecastsViewState extends State<ForecastsView> {
  final ForecastsViewModel viewModel;
  final PageController _pageController = PageController();
  int _currentPage = 0;

  _ForecastsViewState({this.viewModel});

  @override
  Widget build(BuildContext context) {
    var children = viewModel.forecasts.map((forecast) {
      return ForecastView(viewModel: forecast);
    }).toList();
    return Scaffold(
      backgroundColor: Colors.lightBlue[300],
      body: Column(
        children: <Widget>[
          Expanded(
              child: PageView(
            controller: _pageController,
            children: children,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
          )),
          Container(
            height: 70,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                for (int i = 0; i < viewModel.forecasts.length; i++)
                  circleBar(isActive: i == _currentPage)
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget circleBar({bool isActive}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8),
      height: isActive ? 12 : 8,
      width: isActive ? 12 : 8,
      decoration: BoxDecoration(
          color: isActive ? Colors.white : Colors.grey.shade300,
          borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }

  

}