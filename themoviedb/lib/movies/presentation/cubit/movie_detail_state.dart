part of 'movie_detail_cubit.dart';

abstract class MovieDetailState extends Equatable {
  const MovieDetailState();

  @override
  List<Object> get props => [];
}

class MovieDetailInitial extends MovieDetailState {}

class MovieDetailLoading extends MovieDetailState {}

class MovieDetailLoaded extends MovieDetailState {
  const MovieDetailLoaded({required this.movieDetailEntity});
  final MovieDetailEntity movieDetailEntity;

  @override
  List<Object> get props => [movieDetailEntity];
}

class MovieDetailError extends MovieDetailState {
  const MovieDetailError({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}
