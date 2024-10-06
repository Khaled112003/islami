import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:islami/Features/audios/data/audio_repo.dart';
import 'package:islami/Features/audios/data/model/audio_model.dart';

part 'audio_state.dart';

class AudioCubit extends Cubit<AudioState> {
  AudioCubit(this.audioRepo) : super(AudioInitial());
  final AudioRepo audioRepo;
   Future<void> fetchAudioData() async {
    if (isClosed) return;
    if (state is! AudioSuccsess) {
      emit(AudioLoading());
      var result = await audioRepo.fetchAudio();
      if (isClosed) return;
      result.fold((failure) {
        if (!isClosed) emit(AudioFailure(failure.errorMassage));
      }, (audio) {
        if (!isClosed) emit(AudioSuccsess(audio));
      });
    }
  }
}
