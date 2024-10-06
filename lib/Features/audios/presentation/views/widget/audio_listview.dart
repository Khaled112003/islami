import 'package:flutter/material.dart';
import 'package:islami/Features/audios/presentation/views/widget/audio_items.dart';

class AudioListview extends StatelessWidget {
  const AudioListview({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: AudioItem(),
          );
        },
      ),
    );
  }
}
