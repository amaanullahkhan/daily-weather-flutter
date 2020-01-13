import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:weather_app/models/city.dart';
import 'package:flutter/services.dart' show rootBundle;

class LocationsDataProvider {
  Future<List<City>> getAllCities() async {
    var cityString = await rootBundle.loadString("lib/assets/city.json");
    return compute(_parseCities, cityString);
  }
}

// only global functions can be passed to compute(#,#), thats why declaring this on global level.
List<City> _parseCities(String string) {
  final parsed = json.decode(string).cast<Map<String, dynamic>>();
  List<City> cities = parsed.map<City>((json) => City.fromJson(json)).toList();
  cities = cities;
  return cities;
}
