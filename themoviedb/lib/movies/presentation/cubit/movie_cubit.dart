import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:themoviedb/movies/domain/entities/movie_entity.dart';
import 'package:themoviedb/movies/domain/usecase/get_popular_movie_usecase.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieCubit({
    required GetPopularMovieUsecase getPopularMovieUsecase,
  })  : _getPopularMovieUsecase = getPopularMovieUsecase,
        super(MovieInitialState());

  final GetPopularMovieUsecase _getPopularMovieUsecase;
  final List<MovieEntity> _mostPopularMoviesList = [];
  Future<void> getPopularMovieList() async {
    final movieList = await _getPopularMovieUsecase.call(page: 1);
    emit(MovieLoadingState());

    movieList.fold(
        (error) => emit(
              MovieErrorState(
                error.statusMessage,
              ),
            ), (popularMovieList) {
      _mostPopularMoviesList.addAll(popularMovieList.movieList);
      List<MovieEntity> generateList = List.from(_mostPopularMoviesList);
      emit(
        MovieLoadedState(
          generateList,
        ),
      );
    });
  }
}
