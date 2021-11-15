import 'package:themoviedb/core/sqflite/database_config.dart';

class Init {
  Init._();
  static final instance = Init._();

  Future initialize() async {
    await DataBaseConfig.instance.creatDb();
  }
}
