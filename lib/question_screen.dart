import "dart:math";
import 'package:flutter/material.dart';
import 'package:quiz_app/answers.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/displayAnswers.dart';

var randomizer = Random();

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key}) : super(key: key);

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

  void nextQuestion(userResponse){
    setState(() {
      Widget response = Column(children:[
        Text(questions[cur_index].questions),
        Answer(questions[cur_index].answers[0], (){}),
        if (questions[cur_index].answers[0]!=userResponse)
        Answer(userResponse, (){}),
      ]);
      entries.add(response);
      if (marked?.length==questions.length){
        view = "display Answers";
        print("all entries = $entries");
      }
      else{
        // print("current length of marked = ${marked?.length} and user response = $userResponse");
      cur_index = randomizer.nextInt(questions.length);
      var temp = marked?.firstWhere((element) => 
        element==cur_index, 
        orElse: () {
          return -1;
        },
      );
    
      while (temp!=-1){
        cur_index = randomizer.nextInt(questions.length);
        temp = marked?.firstWhere((element) => 
        element==cur_index, 
        orElse: () {
          return -1;
        },
      );
      }
      marked?.add(cur_index);
    }
  });
    
  }

  void resetQuiz(){
    setState(() {
      marked = [];
      entries = [];
      view = "questions";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: (view=="questions")?Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            questions[cur_index].questions,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Answer(
            questions[cur_index].answers[0],
            (){nextQuestion(questions[cur_index].answers[0]);},
          ),
          Answer(
            questions[cur_index].answers[1],
            (){nextQuestion(questions[cur_index].answers[1]);},
          ),
          Answer(
            questions[cur_index].answers[2],
            (){nextQuestion(questions[cur_index].answers[2]);},
          ),
          Answer(
            questions[cur_index].answers[3],
            (){nextQuestion(questions[cur_index].answers[3]);},
          ),
        ],
      ): 
      DisplayAnswers(entries, resetQuiz),
    );
  }
}
