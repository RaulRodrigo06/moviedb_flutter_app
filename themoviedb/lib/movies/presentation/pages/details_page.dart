import 'package:flutter/material.dart';
import 'package:themoviedb/core/app_strings.dart';
import 'package:themoviedb/movies/domain/entities/movie_entity.dart';
import 'package:themoviedb/movies/presentation/page_enum.dart';
import 'package:themoviedb/movies/presentation/widgets/appbar_widget.dart';
import 'package:themoviedb/movies/presentation/widgets/detail_page_appbar_action_widget.dart';
import 'package:themoviedb/movies/presentation/widgets/image_card_widget.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    Key? key,
    required this.movieEntity,
  }) : super(key: key);
  final MovieEntity movieEntity;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          appBarAction: DetailPageAppBarActionWidget(
            movieEntity: movieEntity,
          ),
          title: _appBarTitle(),
          pageEnum: PageEnum.isDetailPage,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 400,
                width: 320,
                child: ImageCardWidget(
                  image: movieEntity.posterPath,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  top: 10,
                  right: 10,
                ),
                child: Text(
                  Strings.overview,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.justify,
                ),
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
        ),
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
