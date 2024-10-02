import 'package:flutter/cupertino.dart';
import 'package:islami/Features/video/presentation/views/widgets/video_item.dart';

class VideosListView extends StatelessWidget {
  const VideosListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10, 
        itemBuilder: (context, index) {
          return VideoItem(
            key: UniqueKey(), 
            initialVideoId: '2Iw2H2pVJVA', 
          );
        },
      ),
    );
  }
}