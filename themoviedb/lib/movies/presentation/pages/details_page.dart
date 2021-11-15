import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themoviedb/core/app_strings.dart';
import 'package:themoviedb/movies/domain/entities/movie_entity.dart';
import 'package:themoviedb/movies/presentation/cubit/movie_detail_cubit.dart';
import 'package:themoviedb/movies/presentation/page_enum.dart';
import 'package:themoviedb/movies/presentation/widgets/appbar_widget.dart';
import 'package:themoviedb/movies/presentation/widgets/card_genres_widget.dart';
import 'package:themoviedb/movies/presentation/widgets/detail_page_appbar_action_widget.dart';
import 'package:themoviedb/movies/presentation/widgets/image_card_widget.dart';
import 'package:themoviedb/movies/presentation/widgets/movie_video_widget.dart';
import 'package:themoviedb/movies/presentation/widgets/subtitles_movie_detail_page_widget.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({
    Key? key,
    required this.movieEntity,
  }) : super(key: key);
  final MovieEntity movieEntity;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  MovieDetailCubit? movieDetailCubit;
  @override
  void initState() {
    super.initState();
    movieDetailCubit = context.read<MovieDetailCubit>();
    movieDetailCubit?.getMovieDetail(id: widget.movieEntity.id);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: CustomAppBar(
          appBarAction: DetailPageAppBarActionWidget(
            movieEntity: widget.movieEntity,
          ),
          title: _appBarTitle(),
          pageEnum: PageEnum.isDetailPage,
        ),
        body: BlocBuilder<MovieDetailCubit, MovieDetailState>(
            builder: (context, state) {
          if (state is MovieDetailError) {
            return Center(
              child: Text(
                state.message,
              ),
            );
          } else if (state is MovieDetailLoaded) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 400,
                    width: 320,
                    child: ImageCardWidget(
                      image: state.movieDetailEntity.posterPath,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 10,
                      right: 10,
                    ),
                    child: SubtitleMovieDetailPageWidget(
                      subtitle: Strings.overview,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(state.movieDetailEntity.overview),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 10,
                      right: 10,
                    ),
                    child: SubtitleMovieDetailPageWidget(
                      subtitle: Strings.genres,
                    ),
                  ),
                  const SizedBox(height: 10),
                  CardGenresWidget(
                    listGenreEntity: state.movieDetailEntity.genresEntity,
                    numberOfGenres: state.movieDetailEntity.genresEntity.length,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 10,
                      right: 10,
                    ),
                    child: SubtitleMovieDetailPageWidget(
                      subtitle: Strings.trailer,
                    ),
                  ),
                  const SizedBox(height: 10),
                  MovieVideoWidget(
                    controller: YoutubePlayerController(
                        initialVideoId: state.movieDetailEntity.movieVideo,
                        flags: const YoutubePlayerFlags(
                          autoPlay: true,
                        )),
                  )
                ],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
      ),
    );
  }

  TextSpan _appBarTitle() {
    return TextSpan(
      text: widget.movieEntity.originalTitle,
      style: TextStyle(
        fontSize: 20,
        color: Colors.yellowAccent[700],
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
