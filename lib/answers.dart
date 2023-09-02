import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  const Answer(this.answer, {super.key});

  final String answer;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
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
