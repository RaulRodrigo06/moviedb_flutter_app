import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themoviedb/injection_container.dart';
import 'package:themoviedb/movies/domain/entities/movie_entity.dart';
import 'package:themoviedb/movies/presentation/cubit/favorite_movie_cubit.dart';
import 'package:themoviedb/movies/presentation/pages/details_page.dart';
import 'package:themoviedb/movies/presentation/widgets/image_card_widget.dart';
import 'package:themoviedb/movies/presentation/widgets/score_widget.dart';
import 'package:themoviedb/movies/presentation/widgets/title_widget.dart';

class CardMoviesWidget extends StatelessWidget {
  const CardMoviesWidget({
    Key? key,
    required this.movieEntity,
  }) : super(key: key);

  final MovieEntity movieEntity;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider<FavoriteMovieCubit>(
              create: (_) => injector<FavoriteMovieCubit>(),
              child: DetailsPage(
                movieEntity: movieEntity,
              ),
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              spreadRadius: 4,
              blurRadius: 4,
              color: Colors.transparent.withAlpha(10),
            )
          ],
        ),
        margin: const EdgeInsets.all(10),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: Colors.white,
          elevation: 20,
          child: Column(
            children: <Widget>[
              TitleWidget(
                title: movieEntity.originalTitle,
              ),
              ScoreWidget(
                voteAvarage: movieEntity.voteAverage,
              ),
              Expanded(
                child: ImageCardWidget(
                  image: movieEntity.posterPath,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
