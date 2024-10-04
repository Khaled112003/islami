import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart'; // مكتبة الكاش
import 'package:islami/core/widgets/loading_video.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:islami/core/constant/my_color.dart';


class VideoItem extends StatefulWidget {
  final String videoUrl, textTopic;

  const VideoItem({Key? key, required this.videoUrl, required this.textTopic}) : super(key: key);

  @override
  _VideoItemState createState() => _VideoItemState();
}

class _VideoItemState extends State<VideoItem> {
  VideoPlayerController? _videoPlayerController;
  ChewieController? _chewieController;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadVideo();
  }

  // تحميل الفيديو باستخدام CacheManager
  Future<void> _loadVideo() async {
    try {
      // تحميل الفيديو من الكاش أو الشبكة، لكن في هذه الحالة استخدم VideoPlayerController.networkUrl
      FileInfo? cachedVideo = await DefaultCacheManager().getFileFromCache(widget.videoUrl);
      
      if (cachedVideo != null && cachedVideo.file.existsSync()) {
        // إذا كان الفيديو في الكاش، استخدم الملف المحفوظ
        _videoPlayerController = VideoPlayerController.file(cachedVideo.file);
      } else {
        // إذا لم يكن في الكاش، استخدم التحميل المباشر من الإنترنت باستخدام networkUrl
        _videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
        
        // وبعد ذلك، احفظ الفيديو في الكاش عند الحاجة
        await DefaultCacheManager().downloadFile(widget.videoUrl);
      }

      await _videoPlayerController!.initialize();
      
      if (mounted) {
      _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController!,
        autoPlay: false,
        looping: true,
      );
      setState(() {
        _isLoading = false;
      });
    }
  } catch (e) {
    print("Error loading video: $e");
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }
}


  @override
  void dispose() {
    _chewieController?.dispose();
    _videoPlayerController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
    child: Container(
      decoration: BoxDecoration(
        color: Mycolors.prayertime,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            if (_chewieController != null && _chewieController!.videoPlayerController.value.isInitialized)
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red, width: 3),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: AspectRatio(
                    aspectRatio: _chewieController!.videoPlayerController.value.aspectRatio,
                    child: Chewie(controller: _chewieController!),
                  ),
                ),
              )
            else if (_isLoading)
            const   ShimmerVideoWithText() 
            else
              const Text('Failed to load video'),
            const SizedBox(height: 10),
            Text(
              widget.textTopic,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    ),
  );
}
}
