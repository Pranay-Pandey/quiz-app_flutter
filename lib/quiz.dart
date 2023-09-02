import 'package:flutter/material.dart';
import 'package:quiz_app/welcome.dart';
import 'package:quiz_app/question_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var currentScreen = 'Welcome-Screen';

  void changeScreen() {
    setState(() {
      currentScreen = 'Question-Screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: (currentScreen == 'Welcome-Screen')
            ? Welcome(changeScreen)
            : const QuestionScreen(),
        backgroundColor: const Color.fromARGB(222, 107, 0, 248),
      ),
    );
  }
}
