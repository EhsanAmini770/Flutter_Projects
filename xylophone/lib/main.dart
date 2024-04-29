import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(
    XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playButton(int soundNumber) {
    final player = AudioPlayer();
    player.play(AssetSource('note$soundNumber.wav'));
  }

  Expanded createKey(int buttonNumber, Color color) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: color, shape: BeveledRectangleBorder()),
        onPressed: () {
          playButton(buttonNumber);
        },
        child: SizedBox.expand(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              createKey(1, Colors.red),
              createKey(2, Colors.orange),
              createKey(3, Colors.yellow),
              createKey(4, Colors.green),
              createKey(5, Colors.teal),
              createKey(6, Colors.blue),
              createKey(7, Colors.purple),
            ],
          ),
        ),
      ),
    );
  }
}
