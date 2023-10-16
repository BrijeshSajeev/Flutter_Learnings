import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Opacity(
          //   opacity: 0.7,
          //   child: Image.asset(
          //     'assets/images/quiz-logo.png',
          //     width: 250,
          //   ),
          // ),
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 250,
            color: const Color.fromARGB(180, 255, 255, 255),
          ),
          const SizedBox(height: 90),
          const Text(
            "Learn flutter the fun way!",
            style: TextStyle(fontSize: 22, color: Colors.white),
          ),
          const SizedBox(height: 20),
          OutlinedButton.icon(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              // padding: const EdgeInsets.only(top: 20),
              backgroundColor: const Color.fromARGB(255, 73, 0, 144),
              foregroundColor: Colors.white,
              textStyle: const TextStyle(
                fontSize: 16,
              ),
            ),
            icon: const Icon(Icons.arrow_forward_rounded),
            label: const Text('Start Quiz'),
          ),
        ],
      ),
    );
  }
}
