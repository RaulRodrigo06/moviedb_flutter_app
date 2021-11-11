import 'package:flutter/material.dart';
import 'package:themoviedb/movies/domain/entities/movie_entity.dart';
import 'package:themoviedb/movies/presentation/page_enum.dart';
import 'package:themoviedb/movies/presentation/widgets/appbar_widget.dart';
import 'package:themoviedb/movies/presentation/widgets/image_card_widget.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    Key? key,
    required this.movieEntity,
  }) : super(key: key);
  final MovieEntity movieEntity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: _appBarTitle(),
        pageEnum: PageEnum.isDetailPage,
      ),
      body: Column(
        children: [
          ImageCardWidget(
            image: movieEntity.posterPath,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '${movieEntity.overview}',
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextSpan _appBarTitle() {
    return TextSpan(
      text: movieEntity.originalTitle,
      style: TextStyle(
        fontSize: 20,
        color: Colors.yellowAccent[700],
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
