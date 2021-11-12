import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
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
  final RefreshController _refreshController = RefreshController();
  RefreshController get refreshController => _refreshController;
  int page = 1;
  Future<void> getPopularMovieList() async {
    final movieList = await _getPopularMovieUsecase.call(page: page);
    emit(MovieLoadingState());

    movieList.fold(
        (error) => emit(
              MovieErrorState(
                error.statusMessage,
              ),
            ), (popularMovieList) {
      _mostPopularMoviesList.addAll(popularMovieList.movieList);
      page++;
      List<MovieEntity> generateList = List.from(_mostPopularMoviesList);
      emit(
        MovieLoadedState(
          generateList,
        ),
      );
    });
  }

  Future<void> onRefresh() async {
    _mostPopularMoviesList.clear();
    page = 1;
    emit(MovieLoadingState());
    await getPopularMovieList();
    _refreshController.loadComplete();
  }

  Future<void> onLoading() async {
    if (page != 500) {
      await getPopularMovieList();
      _refreshController.loadComplete();
    } else {
      _refreshController.loadNoData();
    }
  }
}
