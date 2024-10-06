part of 'audio_cubit.dart';

sealed class AudioState extends Equatable {
  const AudioState();

  @override
  List<Object> get props => [];
}

final class AudioInitial extends AudioState {}

final class AudioLoading extends AudioState {}

final class AudioFailure extends AudioState {
  final String errorMassage;
  const AudioFailure(this.errorMassage);
}

final class AudioSuccsess extends AudioState {
  List<AudioModel> audio;
  AudioSuccsess(this.audio);
}
