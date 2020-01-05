import 'package:weather_app/models/city.dart';
import 'package:weather_app/modules/locations/location_data_provider.dart';

class LocationViewModel {
  final LocationsDataProvider _dataProvider;

  List<City> _cities = [];
  List<City> _filteredCities = [];

  String _searchText;

  Function() reloadData;

  LocationViewModel(this._dataProvider);

  void viewInitState() async {
    _cities = await _dataProvider.getAllCities();
    _filteredCities = _filter(_cities, _searchText);

    if (reloadData != null) {
      reloadData();
    }
  }

  List<City> getCities() {
    return _filteredCities;
  }

  void didSelectCity(int forIndex) {
    print(_filteredCities[forIndex]);
  }

  void didEnterSearch(String text) {
    _searchText = text;
    _filteredCities = _filter(_cities, _searchText);
    reloadData();
  }

  List<City> _filter(List<City> cities, String forText) {
    if (forText == null) {
      return cities;
    }
    return cities.where((city) {
      return "${city.name} ${city.country}".toLowerCase().contains(forText.toLowerCase());
    }).toList();
  }
}
