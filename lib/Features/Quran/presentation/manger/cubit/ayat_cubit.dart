import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:islami/Features/Quran/data/model/surah_model/ayah.dart';
import 'package:islami/Features/Quran/data/model/surah_model/surah_model.dart';
import 'package:islami/Features/Quran/data/repo/surah_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert'; // استيراد JSON

part 'ayat_state.dart';

class AyatCubit extends Cubit<AyatState> {
  AyatCubit(this.surahRepo) : super(AyatInitial());

  final SurahRepo surahRepo;

  Future<void> fetchSurahData({required SurahModel surah}) async {
    if (isClosed) return;

    emit(AyatLoading());

    final prefs = await SharedPreferences.getInstance();
    final cachedAyahsJson = prefs.getString('ayahs_${surah.number}');

    if (cachedAyahsJson != null) {
      final List<dynamic> cachedAyahs = jsonDecode(cachedAyahsJson);
      final List<Ayah> ayahs = cachedAyahs
          .map((json) => Ayah.fromJson(Map<String, dynamic>.from(json)))
          .toList();
      emit(AyatSuccsess(ayahs));
    } else {
      var result = await surahRepo.fetchSurahAyahs(surah);
      result.fold(
        (failure) {
          if (!isClosed) emit(AyatFailure(failure.errorMassage));
        },
        (ayahs) {
          if (!isClosed) {
            final List<Map<String, dynamic>> ayahsJson =
                ayahs.map((ayah) => ayah.toJson()).toList();
            prefs.setString('ayahs_${surah.number}', jsonEncode(ayahsJson));
            emit(AyatSuccsess(ayahs));
          }
        },
      );
    }
  }
}
