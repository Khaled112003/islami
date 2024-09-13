import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:islami/Features/Quran/data/model/surah_model/surah_model.dart';
import 'package:islami/Features/Quran/data/repo/surah_repo.dart';

import 'package:islami/core/utilitis/shared_Preferences.dart';

part 'surah_state.dart';

class SurahCubit extends Cubit<SurahState> {
  SurahCubit(this.surahRepo) : super(SurahInitial());

  final SurahRepo surahRepo;

  Future<void> fetchSurahs() async {
    emit(SurahLoading());

    // Check for cached surah data first
    List<Map<String, dynamic>>? cachedSurahs = SharedPrefsHelper.getData("surah_list");

    if (cachedSurahs != null && cachedSurahs.isNotEmpty) {
      // Convert cached JSON maps to SurahModel objects
      List<SurahModel> surahs = cachedSurahs.map((e) => SurahModel.fromJson(e)).toList();
      emit(SurahSuccsess(surahs));
    } else {
      // Fetch surahs from API if no cached data
      var result = await surahRepo.fetchSurah();
      result.fold(
        (failure) => emit(SurahFailure(failure.errorMassage)),
        (surahs) {
          // Cache the fetched surah data
          SharedPrefsHelper.saveData("surah_list", surahs.map((e) => e.toJson()).toList());
          emit(SurahSuccsess(surahs));
        },
      );
    }
  }

  Future<void> clearCache() async {
    await SharedPrefsHelper.clear();
  }
}
