import 'package:flutter/material.dart';
import 'package:themoviedb/movies/domain/entities/movie_entity.dart';
import 'package:themoviedb/movies/presentation/pages/details_page.dart';
import 'package:themoviedb/movies/presentation/widgets/image_card_widget.dart';

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
            decoration: const BoxDecoration(boxShadow: [
              BoxShadow(spreadRadius: 2, blurRadius: 8, color: Colors.black12)
            ]),
            margin: const EdgeInsets.all(10),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ImageCardWidget(
                      imagem: movieEntity.posterPath,
                    ),
                  ],
                ))));
  }
}
