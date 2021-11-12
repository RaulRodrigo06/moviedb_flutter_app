import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:themoviedb/movies/presentation/page_enum.dart';
import 'package:themoviedb/movies/presentation/widgets/previous_page_button.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  CustomAppBar({
    Key? key,
    required this.title,
    required this.pageEnum,
    required this.appBarAction,
  }) : super(key: key);

  final TextSpan title;
  final PageEnum pageEnum;
  final Widget appBarAction;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text.rich(title),
      backgroundColor: Colors.white.withOpacity(0.9),
      elevation: 8.0,
      leading:
          pageEnum == PageEnum.isDetailPage ? const PreviousPageButton() : null,
      actions: [
        appBarAction,
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
