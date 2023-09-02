import 'package:flutter/material.dart';
import 'package:quiz_app/answers.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Question 1',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Answer(
            "Answer 1",
          ),
          Answer(
            "Answer 2",
          ),
          Answer(
            "Answer 3",
          ),
          Answer(
            "Answer 4",
          ),
        ],
      ),
    );
  }
}
