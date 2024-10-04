import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/Features/video/presentation/manger/video/video_cubit.dart';
import 'package:islami/Features/video/presentation/views/widgets/video_item.dart';
import 'package:islami/core/widgets/failure_error_massege.dart';
import 'package:islami/core/widgets/loading_video.dart'; // تأكد من استيراد الـ ShimmerVideoWithText widget

class VideosListView extends StatelessWidget {
  const VideosListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoCubit, VideoState>(
      builder: (context, state) {
        if (state is VideoSuccsess) {
          return Expanded(
            child: ListView.builder(
              itemCount: state.video.length,
              itemBuilder: (context, index) {
                final video = state.video[index];
                if (video.attachments != null && video.attachments!.isNotEmpty) {
                  final videoUrl = video.attachments![0].url;

                  if (videoUrl != null && videoUrl.endsWith(".mp4")) {
                    return VideoItem(
                      textTopic: video.title ?? "not available topic",
                      videoUrl: videoUrl,
                    );
                  } else {
                    return const Text("الرابط ليس فيديو MP4 متاح");
                  }
                } else {
                  return const Text("لا توجد روابط فيديو متاحة");
                }
              },
            ),
          );
        } 
        else if (state is VideoFailure) {
          return FailureErrorMessage(errormassage: state.errorMassage);
        } 
        else {
          // في حالة الانتظار، نعرض شيمر لعدد من العناصر
          return Expanded(
            child: ListView.builder(
              itemCount: 5, // عدد العناصر الوهمية أثناء التحميل
              itemBuilder: (context, index) {
                return const ShimmerVideoWithText(); // عرض عنصر تحميل شيمر
              },
            ),
          );
        }
      },
    );
  }
}
