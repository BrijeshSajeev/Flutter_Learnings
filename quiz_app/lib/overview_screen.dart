import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/warpper/button_warpper.dart';
import 'package:quiz_app/models/quiz_question.dart';

class OverViewScreen extends StatelessWidget {
  const OverViewScreen(this.setQuestion, {super.key});

  final void Function(List<QuizQuestion> questions) setQuestion;
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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonWarpper(
                      'HTML',
                      setQuestion,
                      Colors.white,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ButtonWarpper('CSS', setQuestion, Colors.white),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonWarpper('Flutter', setQuestion, Colors.white),
                    const SizedBox(
                      width: 20,
                    ),
                    ButtonWarpper('C++', setQuestion, Colors.white),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonWarpper('Java', setQuestion, Colors.white),
                    const SizedBox(
                      width: 20,
                    ),
                    ButtonWarpper('Python', setQuestion, Colors.white),
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
