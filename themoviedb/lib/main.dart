import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themoviedb/core/sqflite/database_config.dart';
import 'package:themoviedb/injection_container.dart';
import 'package:themoviedb/movies/presentation/cubit/favorite_movie_cubit.dart';
import 'package:themoviedb/movies/presentation/cubit/movie_cubit.dart';
import 'package:themoviedb/movies/presentation/pages/home_page.dart';
import 'injection_container.dart' as injection;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injection.init();
  await DataBaseConfig.instance.creatDb();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MultiBlocProvider(
          providers: [
            BlocProvider<MovieCubit>(
              create: (_) => injector<MovieCubit>(),
            ),
            BlocProvider<FavoriteMovieCubit>(
              create: (_) => injector<FavoriteMovieCubit>(),
            ),
          ],
          child: const HomePage(),
        ));
  }
}
