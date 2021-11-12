part of 'movie_cubit.dart';

@immutable
abstract class MovieState extends Equatable {}

class MovieInitialState extends MovieState {
  @override
  List<Object?> get props => [];
}

class MovieLoadingState extends MovieState {
  @override
  List<Object?> get props => [];
}

class MovieErrorState extends MovieState {
  MovieErrorState(this.message);
  final String? message;

  @override
  List<Object?> get props => [message];
}

class MovieLoadedState extends MovieState {
  MovieLoadedState(this.movieListEntity);
  final List<MovieEntity> movieListEntity;

  @override
  List<Object?> get props => [movieListEntity];
}
