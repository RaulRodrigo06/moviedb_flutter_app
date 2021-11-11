import 'package:flutter/material.dart';

class PreviousPageButton extends StatelessWidget {
  const PreviousPageButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Icon(
        Icons.arrow_back,
        color: Colors.yellowAccent[700],
      ),
    );
  }
}
