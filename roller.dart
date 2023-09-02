import 'dart:math';
import "package:flutter/material.dart";

final randomizer = Random();

class DiceRoller extends StatefulWidget{
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState(){
    return _DiceRollerState();
  } 
}

class _DiceRollerState extends State<DiceRoller>{

  var image = 'assets/images/dice-images/dice-1.png';

  void rollDice(){
    var rand = randomizer.nextInt(6)+1;
    setState(() {
      image = 'assets/images/dice-images/dice-$rand.png';
    });
  }

  @override
  Widget build(context){
    return Column(
            mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            image,
            width: 200,
          ),
          const SizedBox(height: 40), 
            TextButton(onPressed: rollDice, style: TextButton.styleFrom(
              foregroundColor: Colors.white, 
              textStyle: const TextStyle(
                fontSize: 28
              )
            ), child: const Text("Roll Dice"))
        ],
      );
  }
}