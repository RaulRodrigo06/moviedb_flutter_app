import 'package:flutter/material.dart';

class ImageCardWidget extends StatelessWidget {
  const ImageCardWidget({
    Key? key,
    this.imagem,
  }) : super(
          key: key,
        );
  final String? imagem;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Image.network(
        'https://image.tmdb.org/t/p/original$imagem',
        fit: BoxFit.cover,
      ),
    );
  }
}
