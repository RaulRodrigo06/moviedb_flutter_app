import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:themoviedb/movies/presentation/page_enum.dart';
import 'package:themoviedb/movies/presentation/widgets/detail_page_appbar_action_widget.dart';
import 'package:themoviedb/movies/presentation/widgets/favorite_page_appbar_action_widget.dart';
import 'package:themoviedb/movies/presentation/widgets/home_page_appbar_action_widget.dart';
import 'package:themoviedb/movies/presentation/widgets/previous_page_button.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  CustomAppBar({
    Key? key,
    required this.title,
    required this.pageEnum,
  }) : super(key: key);

  final TextSpan title;
  final PageEnum pageEnum;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text.rich(title),
      backgroundColor: Colors.white.withOpacity(0.9),
      elevation: 0.0,
      leading:
          pageEnum == PageEnum.isDetailPage ? const PreviousPageButton() : null,
      actions: [
        _actionsAppBar(pageEnum),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  Widget _actionsAppBar(PageEnum pageEnum) {
    switch (pageEnum) {
      case PageEnum.isHomePage:
        return const HomePageAppBarActionWidget();
      case PageEnum.isFavoritePage:
        return const FavoritePageAppBarActionWidget();
      default:
        return const DetailPageAppBarActionWidget();
    }
  }
}
