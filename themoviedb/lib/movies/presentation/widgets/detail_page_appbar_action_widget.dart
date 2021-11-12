import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themoviedb/movies/domain/entities/movie_entity.dart';
import 'package:themoviedb/movies/presentation/cubit/favorite_movie_cubit.dart';

class DetailPageAppBarActionWidget extends StatefulWidget {
  const DetailPageAppBarActionWidget({
    Key? key,
    required this.movieEntity,
  }) : super(key: key);
  final MovieEntity movieEntity;
  @override
  State<DetailPageAppBarActionWidget> createState() =>
      _DetailPageAppBarActionWidgetState();
}

class _DetailPageAppBarActionWidgetState
    extends State<DetailPageAppBarActionWidget> {
  @override
  void initState() {
    BlocProvider.of<FavoriteMovieCubit>(context).getFavoriteMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30),
      child: InkWell(
        onTap: () {
          BlocProvider.of<FavoriteMovieCubit>(context).addFavoriteMovie(
            widget.movieEntity,
          );
        },
        child: BlocBuilder<FavoriteMovieCubit, FavoriteMovieState>(
          builder: (context, state) {
            if (state is FavoriteMovieLoadedState) {
              return state.movieListEntity.contains(widget.movieEntity)
                  ? Icon(
                      Icons.star,
                      color: Colors.yellowAccent[700],
                    )
                  : Icon(
                      Icons.star_border_outlined,
                      color: Colors.yellowAccent[700],
                    );
            } else {
              return Icon(
                Icons.star_border_outlined,
                color: Colors.yellowAccent[700],
              );
            }
          },
        ),
      ),
    );
  }
}
