import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class Strings {
  static const overview = 'Overview';
  static const noConnection = 'No network connection. Try again later.';
  static const standardErrorMessage =
      'Sorry we had an unexpected event, please try again later';
  static TextSpan titleAppBarHome() {
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
