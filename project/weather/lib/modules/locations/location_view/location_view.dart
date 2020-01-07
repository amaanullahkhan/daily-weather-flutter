import 'package:flutter/material.dart';
import 'package:weather_app/modules/locations/location_view_model/location_view_model.dart';

class LocationView extends StatefulWidget {
  final LocationViewModel viewModel;

  LocationView(this.viewModel);

  @override
  _LocationViewState createState() => _LocationViewState(viewModel);
}

class _LocationViewState extends State<LocationView> {
  final LocationViewModel viewModel;

  final TextEditingController _searchFieldController = TextEditingController();

  _LocationViewState(this.viewModel);

  @override
  void initState() {
    viewModel.viewInitState();

    viewModel.reloadData = () {
      setState(() {});
    };

    viewModel.dismiss = () {
      Navigator.of(context).pop();
    };

    _searchFieldController.addListener(() {
      viewModel.didEnterSearch(_searchFieldController.text);
    });

    super.initState();
  }

  @override
  void dispose() {
    viewModel.reloadData = null;
    viewModel.dismiss = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var cities = viewModel.getCities();
    return Scaffold(
      body: ListView.builder(
        itemCount: cities.length,
        itemBuilder: (context, index) {
          if (index == 0) {
            return TextField(controller: _searchFieldController);
          }
          index = index - 1;
          var city = cities[index];
          return ListTile(
            title: Text("${city.name}, ${city.country}"),
            onTap: () {
              viewModel.didSelectCity(index);
            },
          );
        },
      ),
    );
  }
}
