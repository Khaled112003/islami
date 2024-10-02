import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:islami/Features/video/presentation/views/videos_listview.dart';
import 'package:islami/Features/video/presentation/views/widgets/video_item.dart';
import 'package:islami/core/widgets/appbar_item.dart';

class VideoPage extends StatelessWidget {
  const VideoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppbarItem(
              text: 'videos',
              onPressed: () {
                context.pop();
              }),
          VideosListView()

        ],
      ),
    );
  }
}







