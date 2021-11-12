import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themoviedb/core/app_strings.dart';
import 'package:themoviedb/movies/presentation/cubit/favorite_movie_cubit.dart';
import 'package:themoviedb/movies/presentation/page_enum.dart';
import 'package:themoviedb/movies/presentation/widgets/appbar_widget.dart';
import 'package:themoviedb/movies/presentation/widgets/card_movies_widget.dart';
import 'package:themoviedb/movies/presentation/widgets/favorite_page_appbar_action_widget.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  FavoriteMovieCubit? favoriteMovieCubit;
  @override
  void initState() {
    super.initState();
    favoriteMovieCubit = context.read<FavoriteMovieCubit>();
    favoriteMovieCubit?.getFavoriteMovies();
  }

  @override
  void dispose() {
    favoriteMovieCubit?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: CustomAppBar(
          title: Strings.titleAppBarStandard(),
          pageEnum: PageEnum.isFavoritePage,
          appBarAction: const FavoritePageAppBarActionWidget(),
        ),
        body: BlocBuilder<FavoriteMovieCubit, FavoriteMovieState>(
          builder: (context, state) {
            if (state is FavoriteMovieLoadedState) {
              return ListView.builder(
                  itemCount: state.movieListEntity.length,
                  itemBuilder: (context, index) {
                    return CardMoviesWidget(
                      movieEntity: state.movieListEntity[index],
                      isFavoritePage: true,
                    );
                  });
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
