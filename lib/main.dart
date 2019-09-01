import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  final player = AudioCache();

  void playSound(String sound) {
    player.play(sound);
  }

  List<Widget> _createChildren() {
    List<Widget> sounds = new List();
    List<MaterialColor> colors = [
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.green,
      Colors.teal,
      Colors.blue,
      Colors.purple,
    ];
    for (int i = 1; i < 8; i++) {
      sounds.add(
        Expanded(
          child: FlatButton(
            onPressed: () {
              playSound('note$i.wav');
            },
            color: colors[i-1],
            child: null,
          ),
        ),
      );
    }
    return sounds;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: _createChildren(),
          ),
        ),
      ),
    );
  }
}
