part of 'audio_cubit.dart';

sealed class AudioState extends Equatable {
  const AudioState();

  @override
  List<Object> get props => [];
}

final class AudioInitial extends AudioState {}
