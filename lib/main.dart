import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

  Future<void> playNotes(int note) async {
    final player = AudioPlayer();
    await player.play(AssetSource('note$note.wav'));
  }

  Expanded buildKey(Color color, int note) {
    return Expanded(
      child: TextButton(
        onPressed: () async {
          playNotes(note);
        },
        style: TextButton.styleFrom(
          backgroundColor: color,
        ),
        child: Container(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              buildKey(Colors.red, 1),
              buildKey(Colors.orange, 2),
              buildKey(Colors.yellow, 3),
              buildKey(Colors.green, 4),
              buildKey(Colors.blue, 5),
              buildKey(Colors.indigo, 6),
              buildKey(Colors.purple, 7),
            ],
          ),
        ),
      ),
    );
  }
}
