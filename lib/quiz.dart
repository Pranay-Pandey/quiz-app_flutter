import 'package:flutter/material.dart';
import 'package:quiz_app/welcome.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/quiz_results.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<int>? marked = [];
  List<String> response = [];
  List<String> answers = [];
  List<String> questionsText = [];
  var currentScreen = 'Welcome-Screen';

  void changeScreen() {
    setState(() {
      currentScreen = 'Question-Screen';
    });
  }

  void addEntry(String question, String answer, String reponse) {
    setState(() {
      questionsText.add(question);
      response.add(reponse);
      answers.add(answer);

      if (questionsText.length == questions.length) {
        currentScreen = 'result-Screen';
      }
    });
  }

  void resetQuiz() {
    setState(() {
      questionsText = [];
      response = [];
      answers = [];
      currentScreen = 'Welcome-Screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget? screen;
    if (currentScreen == 'Welcome-Screen') {
      screen = Welcome(changeScreen);
    } else if (currentScreen == 'Question-Screen') {
      screen = QuestionScreen(addEntry);
    } else if (currentScreen == 'result-Screen') {
      screen = ResultScreen(
          questionText: questionsText,
          answers: answers,
          response: response,
          resetQuiz: resetQuiz);
    } else {
      screen = Welcome(changeScreen);
    }

    return MaterialApp(
      home: Scaffold(
        body: screen,
        backgroundColor: const Color.fromARGB(222, 107, 0, 248),
      ),
    );
  }
}
