import 'package:flutter/material.dart';
import 'package:themoviedb/movies/domain/entities/genres_entity.dart';

class CardGenresWidget extends StatelessWidget {
  const CardGenresWidget({
    Key? key,
    required this.numberOfGenres,
    required this.listGenreEntity,
  }) : super(key: key);
  final int numberOfGenres;
  final List<GenresEntity> listGenreEntity;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (BuildContext context, int index) =>
            const VerticalDivider(
          color: Colors.white,
          width: 5,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: listGenreEntity.length,
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(25),
                  ),
                  color: Colors.yellowAccent[700],
                ),
                child: Text(
                  listGenreEntity[index].genre,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
