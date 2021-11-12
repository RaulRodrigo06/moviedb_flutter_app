import 'package:get_it/get_it.dart';
import 'package:themoviedb/core/sqflite/i_database.dart';

class DataBaseConfig {
  IDataBase? _db;
  static DataBaseConfig? _dbc;

  static DataBaseConfig get instance {
    return _dbc ?? DataBaseConfig();
  }

  DataBaseConfig() {
    _db = GetIt.I.get<IDataBase>();
  }

  // Future criarBanco() async {
  //   await _db?.initDataBase('dashboard_sprints_db', 1, _getQueries());
  // }

  // List<String> _getQueries() {
  //   return [
  //     CreateTableQueries.queryFolders,
  //     CreateTableQueries.queryTags,
  //     CreateTableQueries.queryTasks,
  //     CreateTableQueries.queryCustomField,
  //     CreateTableQueries.queryOptions,
  //     CreateTableQueries.querySquad,
  //     CreateTableQueries.queryList,
  //   ];
  // }
}