import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themoviedb/core/app_strings.dart';
import 'package:themoviedb/movies/presentation/cubit/movie_cubit.dart';
import 'package:themoviedb/movies/presentation/page_enum.dart';
import 'package:themoviedb/movies/presentation/widgets/appbar_widget.dart';
import 'package:themoviedb/movies/presentation/widgets/card_movies_widget.dart';
import 'package:themoviedb/movies/presentation/widgets/home_page_appbar_action_widget.dart';

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
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        title: Strings.titleAppBarHome(),
        pageEnum: PageEnum.isHomePage,
        appBarAction: const HomePageAppBarActionWidget(),
      ),
      body: BlocBuilder<MovieCubit, MovieState>(
        builder: (context, state) {
          if (state is MovieLoadedState) {
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 0.5),
                itemCount: state.movieListEntity.movieList.length,
                itemBuilder: (context, index) {
                  return CardMoviesWidget(
                    movieEntity: state.movieListEntity.movieList[index],
                  );
                });
          } else if (state is MovieErrorState) {
            return Center(
              child: Text(state.message ?? 'sorry we found an error'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
