abstract class IDataBase {
  Future<int> delete(String table, {String? column, List? whereArgs});

  Future<List<T>> getAll<T>(
      String tabela, T Function(Map<String, dynamic> p1) funcaoDeConversao,
      {String? where, List? whereArgs, String? orderBy});

  Future<int> insert(String tabela, Map<String, dynamic> objeto);

  Future initDataBase(String nomeDB, int versaoDB, List<String> queries);
}
