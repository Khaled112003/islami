import 'dart:async';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:islami/core/constant/my_color.dart';

class AudioItem extends StatefulWidget {
  const AudioItem({Key? key, required this.text, required this.audioUrl}) : super(key: key);
  final String text,audioUrl;

  @override
  _AudioItemState createState() => _AudioItemState();
}

class _AudioItemState extends State<AudioItem> {
  late AudioPlayer _audioPlayer;
  PlayerState _playerState = PlayerState.stopped;
  late StreamSubscription _playerStateSubscription;

  // رابط صوت ثابت للتجربة
 
  // حالة للتحكم بكتم الصوت
  bool _isMuted = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _playerStateSubscription =
        _audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
      if (mounted) {
        setState(() {
          _playerState = state;
        });
      }
    });
  }

  @override
  void dispose() {
    _playerStateSubscription.cancel();
    _audioPlayer.dispose();
    super.dispose();
  }

  // كتم/إلغاء كتم الصوت
  void _toggleMute() {
    setState(() {
      _isMuted = !_isMuted;
    });
    _audioPlayer.setVolume(_isMuted ? 0 : 1);
  }

  void _playPauseAudio() {
    if (_playerState == PlayerState.playing) {
      _audioPlayer.pause();
    } else {
      // استخدم UrlSource لتحديد مصدر الصوت
      _audioPlayer.play(UrlSource(widget.audioUrl));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 189, 186, 186).withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
        color: const Color.fromARGB(255, 234, 238, 244).withOpacity(0.8),
      ),
      width: MediaQuery.of(context).size.width * 0.90,
      child: Column(
        children: [
          Text(
            widget.text,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w900,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(
                  _playerState == PlayerState.playing
                      ? Icons.pause
                      : Icons.play_arrow_rounded,
                  color: Mycolors.green,
                  size: 50,
                ),
                onPressed: _playPauseAudio,
              ),
              IconButton(
                icon: Icon(
                  _isMuted ? Icons.volume_off : Icons.volume_up,
                  color: Mycolors.green, 
                  size: 40,
                ),
                onPressed: _toggleMute,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
