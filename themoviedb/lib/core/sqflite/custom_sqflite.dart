import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class CustomSqflite extends Sqflite {
  Database? db;

  static CustomSqflite? _instance;
  static CustomSqflite get instance {
    return _instance ??= CustomSqflite();
  }

  Future<void> carregarBanco(
    String nomeDoBanco,
    int versaoDoBanco,
    List<String> listaDeQuerysDasTabelas,
  ) async {
    var prefs = await SharedPreferences.getInstance();

    db = await _createDatabase(nomeDoBanco, versaoDoBanco);
    var bancoCriado = prefs.getBool('banco_criado');
    if (bancoCriado == null) {
      for (var query in listaDeQuerysDasTabelas) {
        await db!.execute(query);
      }
      prefs.setBool('banco_criado', true);
    }
  }

  Future _createDatabase(
    String nomeDoBanco,
    int versaoDoBanco,
  ) async {
    return await openDatabase(
      join(
        await getDatabasesPath(),
        nomeDoBanco,
      ),
      version: versaoDoBanco,
    );
  }
}
