import 'package:first_app/text.dart';
import 'package:flutter/material.dart';
import 'package:first_app/roller.dart';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer(this.colorList, {super.key});

  final colorList;

  void rollDice(){

  }

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colorList,
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      child: Center(
          child: DiceRoller()
          // child: TextWidget("Hello World!!")
          ),
    );
  }
}
