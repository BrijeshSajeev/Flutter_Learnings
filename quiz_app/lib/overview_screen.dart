import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/warpper/button_warpper.dart';

class OverViewScreen extends StatelessWidget {
  const OverViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Test your knowladge with various quiz!",
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 213, 186, 244),
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 40,
            ),
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonWarpper('HTML', Colors.white),
                    SizedBox(
                      width: 20,
                    ),
                    ButtonWarpper('CSS', Colors.white),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonWarpper('Flutter', Colors.white),
                    SizedBox(
                      width: 20,
                    ),
                    ButtonWarpper('C++', Colors.white),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonWarpper('Java', Colors.white),
                    SizedBox(
                      width: 20,
                    ),
                    ButtonWarpper('Python', Colors.white),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
