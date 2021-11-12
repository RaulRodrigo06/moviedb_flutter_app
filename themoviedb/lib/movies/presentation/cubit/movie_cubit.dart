import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:themoviedb/core/sqflite/i_database.dart';
import 'package:themoviedb/core/sqflite/table_names.dart';
import 'package:themoviedb/movies/data/model/movie_model.dart';
import 'package:themoviedb/movies/domain/entities/movie_entity.dart';
import 'package:themoviedb/movies/domain/usecase/get_popular_movie_usecase.dart';
import 'package:themoviedb/movies/domain/usecase/get_top_rated_movie_usecase.dart';
import 'package:themoviedb/movies/presentation/sort_enum.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieCubit({
    required GetPopularMovieUsecase getPopularMovieUsecase,
    required GetTopRatedMovieUsecase getTopRatedMovieUsecase,
    required this.dataBase,
    this.sortEnum = SortEnum.popular,
  })  : _getPopularMovieUsecase = getPopularMovieUsecase,
        _getTopRatedMovieUsecase = getTopRatedMovieUsecase,
        super(MovieInitialState());

  final GetPopularMovieUsecase _getPopularMovieUsecase;
  final GetTopRatedMovieUsecase _getTopRatedMovieUsecase;
  final IDataBase dataBase;
  final List<MovieEntity> _movieList = [];
  final RefreshController _refreshController = RefreshController();
  SortEnum sortEnum;
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
      _movieList.addAll(popularMovieList.movieList);
      page++;
      List<MovieEntity> generateList = List.from(_movieList);
      emit(
        MovieLoadedState(
          generateList,
        ),
      );
    });
  }

  Future<void> getMovies() async {
    switch (sortEnum) {
      case SortEnum.popular:
        await getPopularMovieList();
        break;
      case SortEnum.rated:
        await getTopRatedMovieList();
        break;
      default:
        await getFavoriteMovieList();
    }
  }

  Future<void> getTopRatedMovieList() async {
    final movieList = await _getTopRatedMovieUsecase.call(page: page);
    emit(MovieLoadingState());

    movieList.fold(
        (error) => emit(
              MovieErrorState(
                error.statusMessage,
              ),
            ), (popularMovieList) {
      _movieList.addAll(popularMovieList.movieList);
      page++;
      List<MovieEntity> generateList = List.from(_movieList);
      emit(
        MovieLoadedState(
          generateList,
        ),
      );
    });
  }

  Future<void> getFavoriteMovieList() async {
    final _movieList = await dataBase.getAll(
      TableNames.favoriteTable,
      MovieModel.fromDatabase,
    );
    List<MovieEntity> generateList = List.from(_movieList);

    emit(
      MovieLoadedState(
        generateList,
      ),
    );
  }

  Future<void> onRefresh() async {
    _movieList.clear();
    page = 1;
    emit(MovieLoadingState());
    await getMovies();
    _refreshController.loadComplete();
  }

  Future<void> onLoading() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (page != 500 && connectivityResult != ConnectivityResult.none) {
      await getMovies();
      _refreshController.loadComplete();
    } else {
      _refreshController.loadNoData();
    }
  }

  Future<void> setSort(SortEnum sortEnumSelected) async {
    sortEnum = sortEnumSelected;

    await onRefresh();
  }
}
