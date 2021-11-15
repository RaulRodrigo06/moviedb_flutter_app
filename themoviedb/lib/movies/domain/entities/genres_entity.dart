import 'package:equatable/equatable.dart';

class GenresEntity extends Equatable {
  const GenresEntity({
    required this.id,
    required this.genre,
  });
  final int id;
  final String genre;

  @override
  List<Object?> get props => [
        id,
        genre,
      ];
}
