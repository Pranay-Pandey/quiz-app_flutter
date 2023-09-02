import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  const Answer(this.answer, this.selectHandler, {super.key});

  final String answer;
  final Function() selectHandler;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: selectHandler,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40, ),
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepPurpleAccent, 
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
      ),
      child: Text(answer),
    );
  }
}
