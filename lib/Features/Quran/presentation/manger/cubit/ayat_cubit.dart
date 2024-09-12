import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:islami/Features/Quran/data/model/surah_model/ayah.dart';

import 'package:islami/Features/Quran/data/model/surah_model/surah_model.dart';
import 'package:islami/Features/Quran/data/repo/surah_repo.dart';

part 'ayat_state.dart';

// ayat_cubit.dart
class AyatCubit extends Cubit<AyatState> {
  AyatCubit(this.surahRepo) : super(AyatInitial());

  final SurahRepo surahRepo;

  Future<void> fetchSurahData({required SurahModel surah}) async {
    emit(AyatLoading());
    var result = await surahRepo.fetchSurahAyahs(surah);
    result.fold(
      (failure) => emit(AyatFailure(failure.errorMassage)),
      (ayahs) => emit(AyatSuccsess(ayahs)),
    );
  }
}

