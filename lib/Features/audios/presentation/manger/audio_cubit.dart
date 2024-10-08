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
        if (!isClosed) emit(AudioSuccsess(audio ,audio));
      });
    }
  }
 void filterAudio(String query) {
  if (state is AudioSuccsess) {
    final currentState = state as AudioSuccsess;

    if (query.isEmpty) {
      emit(AudioSuccsess(currentState.audio, currentState.audio));
    } else {
      final queryLowered = query.toLowerCase().trim();

      final filtereAudio = currentState.audio.where((audio) {
        final audioNameArabic = audio.name?.toLowerCase().trim() ?? '';
        print('Filtering audio for query: $queryLowered');  // هنا نتأكد من النص

        return audioNameArabic.contains(queryLowered);
      }).toList();

      print('Filtered Audio Count: ${filtereAudio.length}');  // نتحقق من عدد النتائج

      emit(AudioSuccsess(currentState.audio, filtereAudio));
    }
  }
}



}
