abstract class IDataBase {
  Future<int> delete(String table, {String? where, List? whereArgs});

  Future<List<T>> getAll<T>(
      String tabela, T Function(Map<String, dynamic> p1) convertFunction,
      {String? where, List? whereArgs, String? orderBy});

  Future<int> insert(String table, Map<String, dynamic> object);

  Future initDataBase(String dbName, int dbVersion, List<String> queryList);
}
