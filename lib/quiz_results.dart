import 'package:flutter/material.dart';
import 'package:quiz_app/response.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen(
      {super.key,
      required this.questionText,
      required this.answers,
      required this.response, 
      required this.resetQuiz});

  final List<String> questionText;
  final List<String> answers;
  final List<String> response;
  Function resetQuiz;

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
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                  children: <TextSpan>[
                    const TextSpan(
                      text: "You answered ",
                    ),
                    TextSpan(
                      text: correctAnswers
                          .toString(), // Display the correctAnswers variable here
                      style: const TextStyle(
                        color: Colors.green, // Style this part in green color
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const TextSpan(
                      text: " out of ",
                    ),
                    TextSpan(
                      text: totalQuestions
                          .toString(), // Display the totalQuestions variable here
                    ),
                    const TextSpan(
                      text: " questions correctly!",
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Response(
                result,
              ),
              const SizedBox(height: 40),
              TextButton(onPressed: (){resetQuiz();}, child: const Text("Reset quiz"))
            ],
          ),
        ));
  }
}
