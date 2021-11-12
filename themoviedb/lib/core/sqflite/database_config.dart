import 'package:get_it/get_it.dart';
import 'package:themoviedb/core/sqflite/i_database.dart';
import 'package:themoviedb/core/sqflite/queries.dart';

class DataBaseConfig {
  IDataBase? _db;
  static DataBaseConfig? _dbc;

  static DataBaseConfig get instance {
    return _dbc ?? DataBaseConfig();
  }

  DataBaseConfig() {
    _db = GetIt.I.get<IDataBase>();
  }

  Future creatDb() async {
    await _db?.initDataBase('movie_db_database', 1, _getQueries());
  }

  List<String> _getQueries() {
    return [
      CreateQueries.favoriteMovies,
    ];
  }
}
