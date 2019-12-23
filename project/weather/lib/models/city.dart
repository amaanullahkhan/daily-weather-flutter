import 'coordinate.dart';

class City {
  int id;
  String name;
  String country;
  Coordinate coordinate;

  City({this.id, this.name, this.country, this.coordinate});

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
        id: json['id'],
        name: json['name'],
        country: json['country'],
        coordinate: json['coordinate']);
  }
}
