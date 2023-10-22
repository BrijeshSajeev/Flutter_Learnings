import 'package:quiz_app/models/quiz_question.dart';

const pythonQuestions = [
  QuizQuestion(
    'What type of language is Python?',
    [
      'High-level programming language',
      'Assembly language',
      'Machine language',
      'Low-level programming language',
    ],
  ),
  QuizQuestion(
    'What is the output of the following code? print(3 * "Hello ")',
    [
      'Hello Hello Hello ',
      'HelloHelloHello',
      'Hello Hello Hello Hello Hello Hello ',
      'An error will occur'
    ],
  ),
  QuizQuestion(
    'What is the result of the expression 3 + 2 * 2?',
    ['7', '10', '5', 'An error will occur'],
  ),
  QuizQuestion(
    'What is the correct way to comment out multiple lines in Python?',
    [
      '# This is a comment',
      '/* This is a comment */',
      '*/ This is a comment /*',
      '// This is a comment'
    ],
  ),
  QuizQuestion(
    'Which of the following data types is immutable in Python?',
    ['Tuple', 'List', 'Dictionary', 'Set'],
  ),
  QuizQuestion(
    'What does the method `append()` do in a Python list?',
    [
      'Adds an element to the end of the list',
      'Removes the last element of the list',
      'Sorts the list in ascending order',
      'Reverses the order of the elements in the list'
    ],
  ),
  QuizQuestion(
    'Which keyword is used to define a function in Python?',
    ['def', 'function', 'define', 'fun'],
  ),
  QuizQuestion(
    'What is the output of the following code? print("Hello" + 3)',
    ['An error will occur', 'Hello3', 'HelloHelloHello', 'HelloHello'],
  ),
  QuizQuestion(
    'What is the purpose of the `elif` keyword in Python?',
    [
      'Allows for multiple conditional statements',
      'Indicates the end of an if-else block',
      'Defines a function',
      'None of the above'
    ],
  ),
  QuizQuestion(
    'What is the result of the expression `5 // 2`?',
    ['2', '2.5', '2.0', '2.2'],
  ),
];
