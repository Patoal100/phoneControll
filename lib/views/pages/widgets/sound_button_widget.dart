import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class SoundButton extends StatelessWidget {
  final String link;
  final double percentage;

  const SoundButton({super.key, required this.link, required this.percentage});

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width * percentage;
    AudioPlayer audioPlayer = AudioPlayer();

    return IconButton(
      onPressed: () async {
        int result = await audioPlayer.play(link);
        if (result == 1) {
          // success
        } else {
          // error
        }
      },
      icon: const Icon(Icons.play_arrow),
      iconSize: size,
    );
  }
}
