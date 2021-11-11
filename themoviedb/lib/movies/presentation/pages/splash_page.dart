import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          color: Colors.yellow,
          child: const Center(
            child: Text('VeryCreatives'),
          ),
        )
      ],
    );
  }
}
