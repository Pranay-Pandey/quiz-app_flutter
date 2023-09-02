import 'package:flutter/material.dart';

class DisplayAnswers extends StatelessWidget{
  const DisplayAnswers(this.userResponse, this.reset, {super.key});

  final List<Widget> userResponse;
  final Function reset;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(children: userResponse),
        ElevatedButton(onPressed: (){reset();}, child: const Text("Reset the quiz"))
      ],
    );
  }
}

