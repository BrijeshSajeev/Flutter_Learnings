import 'package:first_app/dice_roller.dart';
import 'package:flutter/material.dart';
// import 'package:first_app/styled_text.dart';
import 'package:first_app/dice_roller.dart';

Alignment startAlignment = Alignment.topRight;
Alignment endAlignment = Alignment.bottomLeft;

class GradientContainer extends StatelessWidget {
  const GradientContainer(
    this.gradColors, {
    super.key,
  });
  final List<Color> gradColors;

  @override
  Widget build(context) {
    // List<Color> colorList = gradColors.cast<Color>();
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradColors,
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      child: const Center(
        child: DiseRoller(),
      ),
    );
  }
}
