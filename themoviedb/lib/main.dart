import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themoviedb/injection_container.dart';
import 'package:themoviedb/movies/presentation/cubit/movie_cubit.dart';
import 'package:themoviedb/movies/presentation/pages/home_page.dart';
import 'injection_container.dart' as injection;

void main() async {
  await injection.init();
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
        home: BlocProvider<MovieCubit>(
          create: (_) => injector<MovieCubit>(),
          child: const HomePage(),
        ));
  }
}
