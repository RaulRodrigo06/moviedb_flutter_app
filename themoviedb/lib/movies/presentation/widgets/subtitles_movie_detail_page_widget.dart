import 'package:flutter/material.dart';

class SubtitleMovieDetailPageWidget extends StatelessWidget {
  const SubtitleMovieDetailPageWidget({Key? key,required this.subtitle}) : super(key: key);
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle,
      style: const TextStyle(
        fontSize: 15,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
