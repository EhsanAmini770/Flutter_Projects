import 'package:flutter/material.dart';
import 'package:quiz/quizBrain.dart';

QuizBrain quizBrain = new QuizBrain();
void main() => runApp(Quiz());

class Quiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  Expanded newButton(String text, Color backgroundColor) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: TextButton(
          onPressed: () {
            setState(
              () {
                bool userAnswer = text.toLowerCase() == 'true';
                if (userAnswer == quizBrain.getAnswerKey()) {
                  listOfIcons.add(Icon(Icons.check, color: Colors.green,));
                } else {
                  listOfIcons.add(Icon(Icons.close, color: Colors.red,));
                }
                quizBrain.nextQuestion();

              },
            );
          },
          style: TextButton.styleFrom(
              backgroundColor: backgroundColor,
              primary: Colors.white,
              shape: BeveledRectangleBorder(),
              textStyle: TextStyle(fontSize: 25)),
          child: Text(text),
        ),
      ),
    );
  }

  List<Icon> listOfIcons = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: Text(
                  quizBrain.getQuestion(),
                  style: TextStyle(fontSize: 25, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          newButton(
            'True',
            Colors.green
          ),
          newButton(
            'False',
            Colors.red
          ),
          Row(
            children: listOfIcons,
          ),
        ],
      ),
    );
  }
}
