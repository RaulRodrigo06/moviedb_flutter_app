// import 'package:flutter/cupertino.dart';
// import 'package:themoviedb/core/sqflite/custom_sqflite.dart';
// import 'package:themoviedb/core/sqflite/i_database.dart';

// class DataBase implements IDataBase {
//   @override
//   Future<int> delete(String table, {String? column, List? whereArgs}) async {
//     debugPrint('delete da tabela: ' + table + 'na column ' + '$column');
//     return await CustomSqflite.instance.db!.delete(
//       table,
//       where: '$column = ?',
//       whereArgs: whereArgs,
//     );
//   }

//   @override
//   Future<List<T>> getAll<T>(
//       String tabela, T Function(Map<String, dynamic>) funcaoDeConversao,
//       {String? where, List<dynamic>? whereArgs, String? orderBy}) async {
//     debugPrint('get all da tabela: ' + tabela);
//     var dadosDoBanco = await CustomSqflite.instance.db!
//         .query(tabela, where: where, whereArgs: whereArgs, orderBy: orderBy);

//     List<T> result = [];
//     for (Map<String, dynamic> item in dadosDoBanco) {
//       result.add(funcaoDeConversao(item));
//     }
//     return result;
//   }

//   @override
//   Future initDataBase(String nomeDB, int versaoDB, List<String> queries) {
//     // TODO: implement initDataBase
//     throw UnimplementedError();
//   }

//   @override
//   Future<int> insert(String tabela, Map<String, dynamic> objeto) async {
//     debugPrint('Inserção da tabela: ' + tabela);
//     int resultado = -1;
//     resultado = await CustomSqflite.instance.db!.insert(tabela, objeto);

//     return resultado;
//   }
// }