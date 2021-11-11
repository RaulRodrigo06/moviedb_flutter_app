import 'package:flutter/material.dart';

class FavoritePageAppBarActionWidget extends StatelessWidget {
  const FavoritePageAppBarActionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(right: 30, left: 20),
        height: 40,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(100),
            topLeft: Radius.circular(100),
          ),
        ),
        child: const Icon(Icons.home),
      ),
    );
  }
}
