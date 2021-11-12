import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themoviedb/injection_container.dart';
import 'package:themoviedb/movies/presentation/cubit/favorite_movie_cubit.dart';
import 'package:themoviedb/movies/presentation/pages/favorite_page.dart';

class HomePageAppBarActionWidget extends StatelessWidget {
  const HomePageAppBarActionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 35,
        top: 5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider<FavoriteMovieCubit>(
                    create: (_) => injector<FavoriteMovieCubit>(),
                    child: const FavoritePage(),
                  ),
                ),
              );
            },
            child: Icon(
              Icons.star_border_outlined,
              color: Colors.yellowAccent[700],
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Icon(
            Icons.filter_list,
            color: Colors.yellowAccent[700],
          ),
        ],
      ),
    );
  }
}
