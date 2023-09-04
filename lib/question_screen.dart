import "dart:math";
import 'package:flutter/material.dart';
import 'package:quiz_app/answers.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

var randomizer = Random();

class QuestionScreen extends StatefulWidget {
  const QuestionScreen(this.addEntry, {Key? key}) : super(key: key);

  final Function addEntry;

  @override
  State<StatefulWidget> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  int cur_index = 0;
  List<int>? marked = [];

  @override
  void initState() {
    cur_index = randomizer.nextInt(questions.length);
    marked?.add(cur_index);
    super.initState();
  }

  void nextQuestion(userResponse) {
    setState(() {
      widget.addEntry(
        questions[cur_index].questions,
        questions[cur_index].answers[0],
        userResponse,
      );

      if (marked?.length==questions.length) {
        return ;
      }
      // print("current length of marked = ${marked?.length} and user response = $userResponse");
      cur_index = randomizer.nextInt(questions.length);
      var temp = marked?.firstWhere(
        (element) => element == cur_index,
        orElse: () {
          return -1;
        },
      );

      while (temp != -1) {
        cur_index = randomizer.nextInt(questions.length);
        temp = marked?.firstWhere(
          (element) => element == cur_index,
          orElse: () {
            return -1;
          },
        );
      }
      marked?.add(cur_index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                questions[cur_index].questions,
                style: GoogleFonts.lato(
                    color: const Color.fromARGB(255, 201, 153, 251),
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              ...questions[cur_index].getShuffledAnswers().map((element) {
                return Column(
                  children: [
                    Answer(
                      element,
                      () {
                        nextQuestion(element);
                      },
                    ),
                    const SizedBox(height: 10)
                  ],
                );
              }),
            ],
          )),
    );
  }
}
