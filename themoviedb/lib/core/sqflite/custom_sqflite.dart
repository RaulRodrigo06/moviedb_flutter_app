import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class CustomSqflite extends Sqflite {
  Database? db;

  static CustomSqflite? _instance;
  static CustomSqflite get instance {
    return _instance ??= CustomSqflite();
  }

  Future<void> loadDb(
    String dbName,
    int dbVersion,
    List<String> queryList,
  ) async {
    var prefs = await SharedPreferences.getInstance();

    db = await _createDatabase(dbName, dbVersion);
    var dbInit = prefs.getBool('init_db');
    if (dbInit == null) {
      for (var query in queryList) {
        await db?.execute(query);
      }
      prefs.setBool('init_db', true);
    }
  }

  Future _createDatabase(
    String dbName,
    int dbVersion,
  ) async {
    return await openDatabase(
      join(
        await getDatabasesPath(),
        dbName,
      ),
      version: dbVersion,
    );
  }
}
