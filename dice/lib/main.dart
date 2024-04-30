import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.cyan.shade800,
        appBar: AppBar(
          title: Text('Dice'),
          backgroundColor: Colors.cyan.shade900,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDice = 1;
  int rightDice = 1;

  void diceChanger() {
    return setState(() {
      leftDice = Random().nextInt(6) + 1;
      rightDice = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              onPressed: () {
                diceChanger();
              },
              child: Image.asset('images/dice$leftDice.png'),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () {
                diceChanger();
              },
              child: Image.asset('images/dice$rightDice.png'),
            ),
          )
        ],
      ),
    );
  }
}
