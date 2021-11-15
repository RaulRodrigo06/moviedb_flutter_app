import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class Strings {
  static const theHotStuff = 'The hot stuff!';
  static const genres = 'Genres';
  static const trailer = 'Trailer';
  static const errorRequestMovieVideo = 'Error requesting movie video';
  static const mostPopular = 'Show me the most popular movies!';
  static const onlyTheBest = 'Only the best!';
  static const topRated = 'Show me the most rated movies!';
  static const favorite = 'My faves!';
  static const favorites = 'Show me my favourite movies';
  static const filterText =
      'In which order would you like to me to list the movies?';
  static const overview = 'Overview';
  static const noConnection = 'No network connection. Try again later.';
  static const standardErrorMessage =
      'Sorry we had an unexpected event, please try again later';
  static TextSpan titleBoxFilter({required title, required subTitle}) {
    return TextSpan(
        text: '$title \n',
        style: const TextStyle(
          fontSize: 14,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        children: <TextSpan>[
          TextSpan(
            text: subTitle,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ]);
  }

  static TextSpan titleAppBarStandard() {
    return TextSpan(
        text: 'Hello, \n ',
        style: const TextStyle(
          fontSize: 12,
          color: Colors.black,
          fontWeight: FontWeight.normal,
        ),
        children: <TextSpan>[
          TextSpan(
            text: 'VeryCreatives \n',
            style: TextStyle(
              fontSize: 20,
              color: Colors.yellowAccent[700],
              fontWeight: FontWeight.bold,
            ),
          ),
          const TextSpan(
            text: 'Check these movies out!',
            style: TextStyle(
              fontSize: 12,
              color: Colors.black,
              fontWeight: FontWeight.normal,
            ),
          ),
        ]);
  }
}
