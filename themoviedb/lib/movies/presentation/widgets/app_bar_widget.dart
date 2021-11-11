import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:themoviedb/movies/presentation/widgets/home_button_widget.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  CustomAppBar({
    Key? key,
    required this.title,
    required this.isDetailPage,
  }) : super(key: key);

  final TextSpan title;
  final bool isDetailPage;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text.rich(title),
      backgroundColor: Colors.white.withOpacity(0.9),
      elevation: 0.0,
      actions: [
        _mudarPaginaCarrinho(isDetailPage),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  Widget _mudarPaginaCarrinho(bool isDetailPage) {
    if (!isDetailPage) return Container();
    return const HomeButton();
  }
}
