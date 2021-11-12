import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themoviedb/core/app_strings.dart';
import 'package:themoviedb/injection_container.dart';
import 'package:themoviedb/movies/presentation/cubit/favorite_movie_cubit.dart';
import 'package:themoviedb/movies/presentation/cubit/movie_cubit.dart';
import 'package:themoviedb/movies/presentation/pages/favorite_page.dart';
import 'package:themoviedb/movies/presentation/sort_enum.dart';
import 'package:themoviedb/movies/presentation/widgets/filter_dialog_option.dart';

class HomePageAppBarActionWidget extends StatefulWidget {
  const HomePageAppBarActionWidget({Key? key}) : super(key: key);

  @override
  State<HomePageAppBarActionWidget> createState() =>
      _HomePageAppBarActionWidgetState();
}

class _HomePageAppBarActionWidgetState
    extends State<HomePageAppBarActionWidget> {
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
          InkWell(
            onTap: () {
              _confirmDialog();
            },
            child: Icon(
              Icons.filter_list,
              color: Colors.yellowAccent[700],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _confirmDialog() async {
    switch (await showDialog<SortEnum>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
            title: const Text(
              Strings.filterText,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
            children: [
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, SortEnum.popular);
                },
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: FilterDialogOption(
                    textBox: Strings.titleBoxFilter(
                      title: Strings.theHotStuff,
                      subTitle: Strings.mostPopular,
                    ),
                  ),
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, SortEnum.rated);
                },
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: FilterDialogOption(
                    textBox: Strings.titleBoxFilter(
                      title: Strings.onlyTheBest,
                      subTitle: Strings.topRated,
                    ),
                  ),
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, SortEnum.favorite);
                },
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: FilterDialogOption(
                    textBox: Strings.titleBoxFilter(
                      title: Strings.favorite,
                      subTitle: Strings.favorites,
                    ),
                  ),
                ),
              ),
            ],
          );
        })) {
      case SortEnum.rated:
        BlocProvider.of<MovieCubit>(context).setSort(SortEnum.rated);
        break;

      case SortEnum.popular:
        BlocProvider.of<MovieCubit>(context).setSort(SortEnum.popular);
        break;
      default:
        BlocProvider.of<MovieCubit>(context).setSort(SortEnum.favorite);
    }
  }
}
