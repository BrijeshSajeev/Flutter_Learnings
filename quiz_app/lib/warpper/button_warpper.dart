import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonWarpper extends StatelessWidget {
  const ButtonWarpper(this.text, this.color, {super.key});

  final String text;
  final Color color;

  @override
  Widget build(context) {
    // return Container(
    //   width: 70,
    //   height: 50,
    //   alignment: Alignment.center,
    //   decoration: BoxDecoration(
    //     shape: BoxShape.rectangle,
    //     color: color,
    //     borderRadius: const BorderRadius.all(
    //       Radius.circular(8),
    //     ),
    //   ),
    //   child: Text(
    //     text,
    //   ),
    // );

    return TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          backgroundColor: color,
          minimumSize: const Size(90, 40),
        ),
        child: Text(
          text,
          style: GoogleFonts.lato(
            color: const Color.fromARGB(255, 176, 97, 241),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ));
  }
}
