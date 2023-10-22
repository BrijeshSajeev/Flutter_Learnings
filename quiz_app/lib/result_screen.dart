import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/models/quiz_question.dart';
import 'package:quiz_app/quiz_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.restartQuiz, this.ques,
      {super.key, required this.choosenAnswer});
  final List<String> choosenAnswer;
  final List<QuizQuestion> ques;
  final void Function() restartQuiz;

  List<Map<String, Object>> getSummeryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': ques[i].text,
        'correct_answer': ques[i].answers[0],
        'user_answer': choosenAnswer[i]
      });
    }

    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummeryData();
    final numTotQuestions = questions.length;
    final numTotCorrect = summaryData
        .where((element) => element['user_answer'] == element['correct_answer'])
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "You answered $numTotCorrect out of $numTotQuestions questions correctly!",
              style: GoogleFonts.lato(
                fontSize: 18,
                color: const Color.fromARGB(255, 184, 141, 233),
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 40,
            ),
            QuizSummary(summaryData),
            const SizedBox(
              height: 40,
            ),
            TextButton.icon(
              onPressed: restartQuiz,
              icon: const Icon(Icons.replay),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              label: const Text("Restart Quiz"),
            )
          ],
        ),
      ),
    );
  }
}
