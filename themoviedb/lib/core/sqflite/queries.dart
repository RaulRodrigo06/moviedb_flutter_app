import 'package:themoviedb/core/sqflite/table_names.dart';

class CreateQueries {
  static const String queryFavorites =
      "CREATE TABLE ${TableNames.favoriteTable} ("
      "insercaoId INTEGER PRIMARY KEY AUTOINCREMENT, "
      "id INT NOT NULL, "
      "poster_path TEXT, "
      "overview TEXT, "
      "release_date TEXT, "
      "original_title TEXT, "
      "vote_average REAL)";
}
