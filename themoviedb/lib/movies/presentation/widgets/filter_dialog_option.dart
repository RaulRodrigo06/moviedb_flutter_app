import 'package:flutter/material.dart';

class FilterDialogOption extends StatelessWidget {
  const FilterDialogOption({
    Key? key,
    required this.textBox,
  }) : super(key: key);

  final TextSpan textBox;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.yellowAccent[700],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text.rich(
        textBox,
        textAlign: TextAlign.center,
      ),
    );
  }
}
