import 'package:equatable/equatable.dart';

class MovieVideoEntity extends Equatable {
  const MovieVideoEntity({
    required this.title,
    required this.key,
    required this.type,
  });
  final String title;
  final String key;
  final String type;

  @override
  List<Object?> get props => [
        title,
        key,
        type,
      ];
}
