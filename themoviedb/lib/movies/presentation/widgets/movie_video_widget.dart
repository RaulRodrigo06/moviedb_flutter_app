import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieVideoWidget extends StatelessWidget {
  const MovieVideoWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final YoutubePlayerController controller;
  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: controller,
      showVideoProgressIndicator: true,
      progressIndicatorColor: Colors.yellowAccent[700],
    );
  }
}
