import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:islami/Features/Quran/data/model/surah_model/surah_model.dart';
import 'package:islami/Features/Quran/data/repo/surah_repo.dart';

part 'surah_state.dart';

class SurahCubit extends Cubit<SurahState> {
  SurahCubit(this.surahRepo) : super(SurahInitial());

  final SurahRepo surahRepo;
  List<SurahModel>? cachedSurah;

  Future<void> fetchSurahData() async {
    if (cachedSurah != null) {
      emit(SurahSuccsess(cachedSurah!));
      return;
    }

    if (!isClosed) {
      emit(SurahLoading());
      var result = await surahRepo.fetchSurah();
      result.fold((failure) {
        if (!isClosed) {
          emit(SurahFailure(failure.errorMassage));
        }
      }, (surah) {
        if (!isClosed) {
          cachedSurah = surah;
          emit(SurahSuccsess(surah));
        }
      });
    }
  }
}