import "dart:math";
import 'package:flutter/material.dart';
import 'package:quiz_app/answers.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/displayAnswers.dart';
import 'package:google_fonts/google_fonts.dart';

var randomizer = Random();

class QuestionScreen extends StatefulWidget {
  QuestionScreen(this.addEntry, {Key? key}) : super(key: key);

  Function addEntry;

  @override
  State<StatefulWidget> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  int cur_index = 0;
  List<int>? marked = [];
  List<Widget> entries = [];
  String view = 'questions';

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
      Widget response = Column(children: [
        Text(questions[cur_index].questions),
        Answer(questions[cur_index].answers[0], () {}),
        if (questions[cur_index].answers[0] != userResponse)
          Answer(userResponse, () {}),
      ]);
      entries.add(response);
      if (marked?.length == questions.length) {
        view = "display Answers";
        print("all entries = $entries");
      } else {
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
      }
    });
  }

  void resetQuiz() {
    setState(() {
      marked = [];
      entries = [];
      view = "questions";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(40),
        child: (view == "questions")
            ? Column(
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
                    return Answer(
                      element,
                      () {
                        nextQuestion(element);
                      },
                    );
                  }),
                ],
              )
            : DisplayAnswers(entries, resetQuiz),
      ),
    );
  }
}
