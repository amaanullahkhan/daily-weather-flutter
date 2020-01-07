import 'package:sqflite/sql.dart';
import 'package:weather_app/models/city.dart';
import 'package:weather_app/persistence/database_manager.dart';

class LocationRepository {
  final DatabaseManager manager;

  LocationRepository(this.manager);

  Future<void> insertCity(City city) async {
    var database = manager.database;
    var success = await database.insert("cities", city.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    print(success);
  }

  Future<List<City>> cities() async {
    var database = manager.database;
    final List<Map<String, dynamic>> maps = await database.query("cities");
    final List<City> cities = List.generate(maps.length, (index) {
      return City.fromJson(maps[index]);
    });
    return cities;
  }

  Future<void> deleteCity(City city) async {
    var database = manager.database;
    var success = await database.delete('cities', where: "id = ?", whereArgs: [city.id]);
    print(success);
  }
}
