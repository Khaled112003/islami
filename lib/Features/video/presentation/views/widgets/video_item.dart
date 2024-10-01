import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/core/constant/my_color.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoItem extends StatelessWidget {
  final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: '2Iw2H2pVJVA', 
    flags: const YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
    ),
  );

  VideoItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Mycolors.collectionColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red, width: 3), 
                borderRadius: BorderRadius.circular(12), 
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12), 
                child: YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                  progressIndicatorColor: Colors.red,
                  width: MediaQuery.of(context).size.width * 0.92,
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "لا حول ولا قوه الا بالله عليه العظيم",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
