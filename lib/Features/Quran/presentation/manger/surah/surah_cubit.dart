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

    List<Map<String, dynamic>>? cachedSurahs =
        SharedPrefsHelper.getData("surah_list");

    if (cachedSurahs != null && cachedSurahs.isNotEmpty) {
      List<SurahModel> surahs =
          cachedSurahs.map((e) => SurahModel.fromJson(e)).toList();
      emit(SurahSuccess(surahs, surahs));
    } else {
      var result = await surahRepo.fetchSurah();
      result.fold(
        (failure) => emit(SurahFailure(failure.errorMassage)),
        (surahs) {
          SharedPrefsHelper.saveData(
              "surah_list", surahs.map((e) => e.toJson()).toList());
          emit(SurahSuccess(surahs, surahs));
        },
      );
    }
  }

  void filterSurahs(String query) {
    if (state is SurahSuccess) {
      final currentState = state as SurahSuccess;

      if (query.isEmpty) {
        emit(SurahSuccess(currentState.allSurahs, currentState.allSurahs));
      } else {
        final filteredSurahs = currentState.allSurahs.where((surah) {
          final surahNameArabic =
              removeDiacritics(surah.name?.toLowerCase().trim() ?? '');
          final surahNameEnglish =
              surah.englishName?.toLowerCase().trim() ?? '';

          final queryWithoutDiacritics =
              removeDiacritics(query.toLowerCase().trim());

          return surahNameEnglish.contains(query.toLowerCase().trim()) ||
              surahNameArabic.contains(queryWithoutDiacritics);
        }).toList();

        emit(SurahSuccess(currentState.allSurahs, filteredSurahs));
      }
    }
  }

  String removeDiacritics(String text) {
    const diacritics = [
      '\u064B', // Tanwin Fathah
      '\u064C', // Tanwin Dammah
      '\u064D', // Tanwin Kasrah
      '\u064E', // Fathah
      '\u064F', // Dammah
      '\u0650', // Kasrah
      '\u0651', // Shaddah
      '\u0652', // Sukun
      '\u0653', // Maddah
      '\u0654', // Hamza above
      '\u0655', // Hamza below
      '\u0670', // Superscript Alef
      '\u06D6', // Small high ligature sad
      '\u06D7', // Small high ligature qaf
      '\u06DF', // Small high meem
      '\u06E0', // Small high lam-alif
      '\u06E5', // Small waw
      '\u06E6', // Small ya
      '\u06EA', // Small high ya
      '\u06EB', // Small low ya
      '\u06EC', // Small low waw
      '\u06ED', // Small high meem isolated form
    ];

    return text.replaceAll(RegExp('[${diacritics.join()}]'), '');
  }
}
