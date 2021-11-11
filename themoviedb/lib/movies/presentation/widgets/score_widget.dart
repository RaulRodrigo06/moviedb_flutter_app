import 'package:flutter/material.dart';

class ScoreWidget extends StatelessWidget {
  const ScoreWidget({
    Key? key,
    this.voteAvarage,
  }) : super(key: key);

  final double? voteAvarage;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              const SizedBox(
                width: 5,
              ),
              Text('$voteAvarage'),
            ],
          ),
          const Icon(
            Icons.keyboard_arrow_right_rounded,
            size: 20,
          )
        ],
      ),
    );
  }
}
