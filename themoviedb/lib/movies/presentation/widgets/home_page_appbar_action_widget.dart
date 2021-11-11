import 'package:flutter/material.dart';

class HomePageAppBarActionWidget extends StatelessWidget {
  const HomePageAppBarActionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 35,
        top: 5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.star_border_outlined,
            color: Colors.yellowAccent[700],
          ),
          const SizedBox(
            width: 15,
          ),
          Icon(
            Icons.filter_list,
            color: Colors.yellowAccent[700],
          ),
        ],
      ),
    );
  }
}
