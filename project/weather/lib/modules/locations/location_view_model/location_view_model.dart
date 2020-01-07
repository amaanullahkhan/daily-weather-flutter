import 'package:weather_app/models/city.dart';
import 'package:weather_app/modules/locations/location_data_provider.dart';

class LocationViewModel {
  final LocationsDataProvider _dataProvider;
  final LocationViewModelProtocol delegate;

  List<City> _cities = [];
  List<City> _filteredCities = [];

  String _searchText;

  Function() reloadData;
  Function() dismiss;

  LocationViewModel(this._dataProvider, this.delegate);

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

  Future<void> didSelectCity(int forIndex) async {

    if (delegate != null) {
      delegate.locationViewModel(this, _filteredCities[forIndex]);
    }

    if (dismiss != null) {
      dismiss();
    }
  }

  void didEnterSearch(String text) {
    _searchText = text;
    _filteredCities = _filter(_cities, _searchText);

    if (reloadData != null) {
      reloadData();
    }
  }

  List<City> _filter(List<City> cities, String forText) {
    if (forText == null) {
      return cities;
    }
    return cities.where((city) {
      return "${city.name} ${city.country}"
          .toLowerCase()
          .contains(forText.toLowerCase());
    }).toList();
  }
}

abstract class LocationViewModelProtocol {
  Future<void> locationViewModel(LocationViewModel viewModel, City selectedCity);
}
