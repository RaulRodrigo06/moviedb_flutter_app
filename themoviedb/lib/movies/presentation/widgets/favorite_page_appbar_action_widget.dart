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
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(
          right: 35,
          top: 5,
        ),
        child: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.home,
            color: Colors.yellowAccent[700],
          ),
        ),
      ),
    );
  }
}
