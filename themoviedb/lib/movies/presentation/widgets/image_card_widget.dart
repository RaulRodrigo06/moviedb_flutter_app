import 'package:flutter/material.dart';

class ImageCardWidget extends StatelessWidget {
  const ImageCardWidget({
    Key? key,
    this.image,
  }) : super(
          key: key,
        );
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      'https://image.tmdb.org/t/p/original$image',
      fit: BoxFit.fill,
      errorBuilder:
          (BuildContext context, Object exception, StackTrace? stackTrace) {
        return const Icon(
          Icons.image,
        );
      },
    );
  }
}
