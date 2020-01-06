import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseManager {
  static final DatabaseManager shared = DatabaseManager();

  Database database;

  void openDB() async {
    var dbPath = await getDatabasesPath();
    var weatherDbPath = join(dbPath, 'weather_database');
    database = await openDatabase(
      weatherDbPath,
      // When the database is first created, create tables.
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE cities(id INTEGER PRIMARY KEY, name TEXT, country TEXT)",
        );
      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
    );
  }
}
