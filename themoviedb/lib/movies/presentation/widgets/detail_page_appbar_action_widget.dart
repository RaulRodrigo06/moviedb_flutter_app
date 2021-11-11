import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themoviedb/movies/presentation/cubit/movie_cubit.dart';

class DetailPageAppBarActionWidget extends StatefulWidget {
  const DetailPageAppBarActionWidget({Key? key}) : super(key: key);

  @override
  State<DetailPageAppBarActionWidget> createState() =>
      _DetailPageAppBarActionWidgetState();
}

class _DetailPageAppBarActionWidgetState
    extends State<DetailPageAppBarActionWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30),
      child: InkWell(
          onTap: () {
            BlocProvider.of<MovieCubit>(context).getPopularMovieList();
          },
          child: Icon(
            Icons.star,
            color: Colors.yellowAccent[700],
          )),
    );
  }
}
