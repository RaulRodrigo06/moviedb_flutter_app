import 'package:flutter/material.dart';
import 'package:themoviedb/movies/domain/entities/movie_entity.dart';
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
            builder: (context) => const DetailsPage(),
          ),
        );
      },
      child: Container(
        height: 1000,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              spreadRadius: 7,
              blurRadius: 8,
              color: Colors.white,
            )
          ],
        ),
        margin: const EdgeInsets.all(10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Column(
            children: <Widget>[
              TitleWidget(
                title: movieEntity.originalTitle,
              ),
              ScoreWidget(
                voteAvarage: movieEntity.voteAverage,
              ),
              ImageCardWidget(
                image: movieEntity.posterPath,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
