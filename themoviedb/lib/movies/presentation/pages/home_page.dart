import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themoviedb/movies/presentation/cubit/movie_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<MovieCubit>(context).getPopularMovieList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home Page'),
      ),
      body: BlocBuilder<MovieCubit, MovieState>(
        builder: (context, state) {
          if (state is MovieLoadingState) {
            return const CircularProgressIndicator();
          } else if (state is MovieLoadedState) {
            return ListView.builder(itemBuilder: (context, index) {
              return Column(
                children: [
                  Text(state.movieListEntity.movieList[index].id.toString()),
                  Text(state.movieListEntity.movieList[index].voteAverage
                      .toString()),
                  Text(state.movieListEntity.movieList[index].originalTitle ??
                      'Dont have Original Title'),
                  Text(state.movieListEntity.movieList[index].overview ??
                      'Dont Have a Overview'),
                  Text(state.movieListEntity.movieList[index].posterPath ??
                      'No Pics'),
                  Text(state.movieListEntity.movieList[index].releaseDate ??
                      'TBD'),
                ],
              );
            });
          } else if (state is MovieErrorState) {
            return Center(
              child: Text(state.message ?? 'sorry we found an error'),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
