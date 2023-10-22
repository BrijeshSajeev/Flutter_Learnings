import 'package:quiz_app/models/quiz_question.dart';

const javaQuestions = [
  QuizQuestion(
    'What type of language is Java?',
    [
      'Object-Oriented Programming (OOP)',
      'Procedural',
      'Functional',
      'Markup',
    ],
  ),
  QuizQuestion(
    'Which keyword is used to define a class in Java?',
    [
      'class',
      'type',
      'define',
      'Category',
    ],
  ),
  QuizQuestion(
    'What is the output of the following code: \n\n'
    '```java\n'
    'int x = 5;\n'
    'System.out.println(x++);\n'
    '```',
    [
      '5',
      '6',
      '4',
      'Error',
    ],
  ),
  QuizQuestion(
    'Which data type is used to store whole numbers in Java?',
    [
      'int',
      'float',
      'double',
      'char',
    ],
  ),
  QuizQuestion(
    'What is the correct way to create an instance (object) of a class in Java?',
    [
      'ClassName objectName = new ClassName();',
      'objectName = new ClassName();',
      'new ClassName(objectName);',
      'ClassName objectName = ClassName();',
    ],
  ),
  QuizQuestion(
    'Which loop is guaranteed to execute at least once in Java?',
    [
      'do-while loop',
      'for loop',
      'while loop',
      'if-else loop',
    ],
  ),
  QuizQuestion(
    'What is the default value of an uninitialized variable in Java?',
    [
      '0 (for numeric types)',
      'null (for objects)',
      'false (for boolean)',
      'All of the above',
    ],
  ),
  QuizQuestion(
    'Which keyword is used to inherit a class in Java?',
    [
      'extends',
      'inherits',
      'derives',
      'expands',
    ],
  ),
  QuizQuestion(
    'What is the difference between == and equals() in Java?',
    [
      '== compares references, equals() compares content',
      '== is used for primitive types, equals() for objects',
      '== is used for objects, equals() for primitive types',
      'There is no difference',
    ],
  ),
  QuizQuestion(
    'What is the output of the following code: \n\n'
    '```java\n'
    'String str1 = "Hello";\n'
    'String str2 = "Hello";\n'
    'System.out.println(str1 == str2);\n'
    '```',
    [
      'true',
      'false',
      'It will result in an error',
      'It will print nothing',
    ],
  ),
];
