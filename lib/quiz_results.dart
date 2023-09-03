import 'package:flutter/material.dart';
import 'package:quiz_app/response.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key,
      required this.questionText,
      required this.answers,
      required this.response});

  final List<String> questionText;
  final List<String> answers;
  final List<String> response;

  List<Map<String, Object>> results() {
    List<Map<String, Object>> results = [];
    for (int i = 0; i < questionText.length; i++) {
      results.add({
        'id': i + 1,
        'question': questionText[i],
        'answer': answers[i],
        'response': response[i],
      });
    }
    return results;
  }

  @override
  Widget build(BuildContext context) {
    final result = results();
    final String totalQuestions = questionText.length.toString();
    final String correctAnswers = result
        .where((element) => element['answer'] == element['response'])
        .length
        .toString();
    return SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  "You answered $correctAnswers out of $totalQuestions questions correctly!"),
              const SizedBox(height: 40),
              Response(
                result,
              ),
              const SizedBox(height: 40),
              TextButton(onPressed: () {}, child: const Text("Reset quiz"))
            ],
          ),
        ));
  }
}
