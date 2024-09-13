import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:islami/Features/Quran/data/model/surah_model/surah_model.dart';
import 'package:islami/Features/Quran/data/repo/surah_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'surah_state.dart';

class SurahCubit extends Cubit<SurahState> {
  SurahCubit(this.surahRepo) : super(SurahInitial());

  final SurahRepo surahRepo;

  Future<void> fetchSurahData() async {
    final prefs = await SharedPreferences.getInstance();
    final surahJson = prefs.getString('surahs');

    if (surahJson != null) {
      final List<dynamic> jsonData = jsonDecode(surahJson);
      final List<SurahModel> cachedSurah =
          jsonData.map((data) => SurahModel.fromJson(data)).toList();
      emit(SurahSuccsess(cachedSurah));
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
          final List<Map<String, dynamic>> jsonData =
              surah.map((e) => e.toJson()).toList();
          prefs.setString(
              'surahs', jsonEncode(jsonData)); // تخزين البيانات كـ JSON
          emit(SurahSuccsess(surah));
        }
      });
    }
  }
}
