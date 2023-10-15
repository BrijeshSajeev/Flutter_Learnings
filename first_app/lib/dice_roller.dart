import 'package:flutter/material.dart';
import 'dart:math';
import 'package:first_app/styled_text.dart';

final randomizer = Random();

class DiseRoller extends StatefulWidget {
  const DiseRoller({super.key});
  @override
  State<DiseRoller> createState() {
    return _DiseRollerState();
  }
}

class _DiseRollerState extends State<DiseRoller> {
  var currentDise = 1;
  var score = 0;
  var highScore = 0;
  void rollDice() {
    setState(() {
      currentDise = randomizer.nextInt(6) + 1;
      if (currentDise == 1) {
        score = 0;
      } else {
        score += currentDise;
      }

      if (highScore < score) {
        highScore = score;
      }
    });
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        StyledText('$score'),
        const SizedBox(
          height: 160,
        ),
        Image.asset(
          'assets/images/dice-$currentDise.png',
          width: 150,
        ),
        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
              padding: const EdgeInsets.only(top: 20),
              foregroundColor: Colors.white,
              textStyle: const TextStyle(
                fontSize: 28,
              )),
          child: const Text('Roll Dice'),
        ),
        const SizedBox(
          height: 160,
        ),
        StyledText(
          '$highScore',
          title: 'HIGHSCORE',
        ),
      ],
    );
  }
}
