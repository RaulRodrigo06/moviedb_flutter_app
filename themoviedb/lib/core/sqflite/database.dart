import 'package:flutter/cupertino.dart';
import 'package:themoviedb/core/sqflite/custom_sqflite.dart';
import 'package:themoviedb/core/sqflite/i_database.dart';

class DataBase implements IDataBase {
  @override
  Future<int> delete(String table, {String? column, List? whereArgs}) async {
    return await CustomSqflite.instance.db!.delete(
      table,
      where: '$column = ?',
      whereArgs: whereArgs,
    );
  }

  @override
  Future<List<T>> getAll<T>(
      String tabela, T Function(Map<String, dynamic>) funcaoDeConversao,
      {String? where, List<dynamic>? whereArgs, String? orderBy}) async {
    var dadosDoBanco = await CustomSqflite.instance.db!
        .query(tabela, where: where, whereArgs: whereArgs, orderBy: orderBy);

    List<T> result = [];
    for (Map<String, dynamic> item in dadosDoBanco) {
      result.add(funcaoDeConversao(item));
    }
    return result;
  }

  @override
  Future initDataBase(String nomeDB, int versaoDB, List<String> queries) async {
    try {
      await CustomSqflite.instance.carregarBanco(nomeDB, versaoDB, queries);
    } on Exception catch (error) {
      debugPrint(error.toString());
    }
  }

  @override
  Future<int> insert(String tabela, Map<String, dynamic> objeto) async {
    int resultado = -1;
    resultado = await CustomSqflite.instance.db!.insert(tabela, objeto);

    return resultado;
  }
}
