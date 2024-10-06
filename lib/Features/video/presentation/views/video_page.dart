import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:islami/Features/video/presentation/manger/video/video_cubit.dart';
import 'package:islami/Features/video/presentation/views/widgets/videos_listview.dart';

import 'package:islami/core/widgets/appbar_item.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({super.key});

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  @override
  @override
  void initState() {
    super.initState();

    // تحقق من حالة الاتصال قبل جلب البيانات
    Connectivity().checkConnectivity().then((connectivityResult) {
      if (connectivityResult != ConnectivityResult.none) {
        BlocProvider.of<VideoCubit>(context).fetchVideoData();
      } else {
        // عرض رسالة خطأ أو نص مناسب
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("لا يوجد اتصال بالإنترنت")),
        );
      }
    });
  }

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
          const VideosListView()
        ],
      ),
    );
  }
}
