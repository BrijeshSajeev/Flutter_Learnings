import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/cpp_questions.dart';
import 'package:quiz_app/data/css_questions.dart';
import 'package:quiz_app/data/html_questions.dart';
import 'package:quiz_app/data/java_questions.dart';
import 'package:quiz_app/data/python_questions.dart';
import 'package:quiz_app/data/questions.dart';
// import 'package:quiz_app/models/quiz_question.dart';
import 'package:quiz_app/quiz.dart';
import 'package:quiz_app/models/quiz_question.dart';

class ButtonWarpper extends StatelessWidget {
  const ButtonWarpper(this.text, this.setQuestion, this.color, {super.key});

  final String text;
  final Color color;
  final void Function(List<QuizQuestion> questions) setQuestion;

  void selectQuestion() {
    if (text == 'Java') {
      setQuestion(javaQuestions);
    } else if (text == 'Flutter') {
      setQuestion(questions);
    } else if (text == 'CSS') {
      setQuestion(cssQuestions);
    } else if (text == 'C++') {
      setQuestion(cppQuestions);
    } else if (text == 'HTML') {
      setQuestion(htmlQuestions);
    } else if (text == 'Python') {
      setQuestion(pythonQuestions);
    }
  }

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
        onPressed: selectQuestion,
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
