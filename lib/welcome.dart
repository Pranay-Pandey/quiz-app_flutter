import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome(this.changeScreen, {super.key});

  final void Function() changeScreen; 
  @override
  Widget build(context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 280,
          color: const Color.fromARGB(140, 255, 255, 255),
        ),
        const SizedBox(
          height: 60,
        ),
        const Text(
          'Learn Flutter the fun way!',
          style: TextStyle(fontSize: 26.0, color: Colors.white),
        ),
        const SizedBox(height: 20),
        OutlinedButton.icon(
          // style: const ButtonStyle(backgroundColor: Colors.blueGrey),
          onPressed: changeScreen,
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
          ),
          icon: Icon(Icons.arrow_forward),
          label: const Text(
            "Start Quiz",
          ),
        ),
      ],
    ));
  }
}
