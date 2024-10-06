import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:islami/Features/video/data/repo/video_repo.dart';
import 'package:islami/Features/video/data/videos_model/video_model.dart';

part 'video_state.dart';

class VideoCubit extends Cubit<VideoState> {
  VideoCubit(this.videoRepo) : super(VideoInitial());
  final VideoRepo videoRepo;

  Future<void> fetchVideoData() async {
    if (isClosed) return;
    if (state is! VideoSuccsess) {
      emit(VideoLoading());
      var result = await videoRepo.fetchvideo();
      if (isClosed) return;
      result.fold((failure) {
        if (!isClosed) emit(VideoFailure(failure.errorMassage));
      }, (video) {
        if (!isClosed) emit(VideoSuccsess(video));
      });
    }
  }
}
