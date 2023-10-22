import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/models/quiz_question.dart';
// import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/overview_screen.dart';
import 'package:quiz_app/quiz_screen.dart';
import 'package:quiz_app/result_screen.dart';
import 'package:quiz_app/start_screen.dart';
// import 'package:quiz_app/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectAnswers = [];
  List<QuizQuestion> question = questions;
  Widget? activeState;

  @override
  void initState() {
    super.initState();
    activeState = StartScreen(switchScreen);
  }

  void restartQuiz() {
    setState(() {
      activeState = OverViewScreen(setQuestion);
    });
  }

  void chooseAnswer(String ans) {
    selectAnswers.add(ans);
    if (selectAnswers.length == question.length) {
      setState(() {
        activeState =
            ResultScreen(restartQuiz, question, choosenAnswer: selectAnswers);
        selectAnswers = [];
      });
    }
  }

  void switchScreen() {
    setState(() {
      activeState = OverViewScreen(setQuestion);
    });
  }

  void setQuestion(List<QuizQuestion> ques) {
    setState(() {
      question = ques;
      activeState = QuizScreen(question, onSelectAnswer: chooseAnswer);
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeState,
        ),
      ),
    );
  }
}
