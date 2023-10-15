import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  const StyledText(this.text, {super.key, this.title = 'SCORE'});

  final String text;
  final String title;

  @override
  Widget build(context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '$title : ',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 38,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 38,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
