
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

 List<City> _parseCities(String string) {
    final parsed = json.decode(string).cast<Map<String, dynamic>>();
    return parsed.map<City>((json) => City.fromJson(json)).toList();
  }
