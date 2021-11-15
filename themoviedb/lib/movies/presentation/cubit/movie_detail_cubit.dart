
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:themoviedb/core/app_strings.dart';
import 'package:themoviedb/movies/domain/entities/movie_detail_entity.dart';
import 'package:themoviedb/movies/domain/usecase/get_movie_detail_usecase.dart';
import 'package:themoviedb/movies/domain/usecase/get_movie_video_usecase.dart';

part 'movie_detail_state.dart';

class MovieDetailCubit extends Cubit<MovieDetailState> {
  MovieDetailCubit({
    required GetMovieVideoUsecase getMovieVideoUsecase,
    required GetMovieDetailUsecase getMovieDetailUsecase,
  })  : _getMovieVideoUsecase = getMovieVideoUsecase,
        _getMovieDetailUsecase = getMovieDetailUsecase,
        super(MovieDetailInitial());

  final GetMovieVideoUsecase _getMovieVideoUsecase;
  final GetMovieDetailUsecase _getMovieDetailUsecase;

  Future<void> getMovieDetail({required int id}) async {
    final movieDetail = await _getMovieDetailUsecase.call(id: id);
    final movieVideo = await _getMovieVideoUsecase.call(id: id);
    emit(MovieDetailLoading());

    String _movieVideoResult = movieVideo.fold(
      (error) => Strings.errorRequestMovieVideo,
      (movieVideo) => movieVideo.listMovieVideoEntity.first.key,
    );

    movieDetail.fold(
      (error) => emit(MovieDetailError(
        message: error.statusMessage,
      )),
      (movieDetail) => emit(
        MovieDetailLoaded(
          movieDetailEntity: MovieDetailEntity(
            tagline: movieDetail.tagline,
            overview: movieDetail.overview,
            genresEntity: movieDetail.genresEntity,
            movieVideo: _movieVideoResult,
            posterPath: movieDetail.posterPath,
            originalTitle: movieDetail.originalTitle,
          ),
        ),
      ),
    );
  }
}
