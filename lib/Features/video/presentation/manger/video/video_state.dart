part of 'video_cubit.dart';

sealed class VideoState extends Equatable {
  const VideoState();

  @override
  List<Object> get props => [];
}

final class VideoInitial extends VideoState {}

final class VideoLoading extends VideoState {}

final class VideoFailure extends VideoState {
  final String errorMassage;
  const VideoFailure(this.errorMassage);
}

final class VideoSuccsess extends VideoState {
  List<VideosModel> video;
  VideoSuccsess(this.video);
}
