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

    _searchFieldController.addListener(() {
      viewModel.didEnterSearch(_searchFieldController.text);
    });

    super.initState();
  }

  @override
  void dispose() {
    viewModel.reloadData = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    children.add(TextField(controller: _searchFieldController));
    children.addAll(viewModel.getCities().map((city) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("${city.name}, ${city.country}"),
      );
    }).toList());

    return Scaffold(
      body: ListView(
        children: children,
      ),
    );
  }
}
