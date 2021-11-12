import 'package:flutter/cupertino.dart';
import 'package:themoviedb/core/sqflite/custom_sqflite.dart';
import 'package:themoviedb/core/sqflite/i_database.dart';

class DataBase implements IDataBase {
  @override
  Future<int> delete(String table, {String? where, List? whereArgs}) async {
    return await CustomSqflite.instance.db!.delete(
      table,
      where: '$where = ?',
      whereArgs: whereArgs,
    );
  }

  @override
  Future<List<T>> getAll<T>(
      String tabela, T Function(Map<String, dynamic>) convertFunction,
      {String? where, List<dynamic>? whereArgs, String? orderBy}) async {
    var dbData = await CustomSqflite.instance.db!
        .query(tabela, where: where, whereArgs: whereArgs, orderBy: orderBy);

    List<T> result = [];
    for (Map<String, dynamic> item in dbData) {
      result.add(convertFunction(item));
    }
    return result;
  }

  @override
  Future initDataBase(String dbName, int dbVersion, List<String> queryList) async {
    try {
      await CustomSqflite.instance.loadDb(dbName, dbVersion, queryList);
    } on Exception catch (error) {
      debugPrint(error.toString());
    }
  }

  @override
  Future<int> insert(String table, Map<String, dynamic> object) async {
    int result = -1;
    result = await CustomSqflite.instance.db!.insert(table, object);

    return result;
  }
}
