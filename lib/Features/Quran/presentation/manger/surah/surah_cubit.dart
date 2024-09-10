import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:islami/Features/Quran/data/model/surah_model/surah_model.dart';
import 'package:islami/Features/Quran/data/repo/surah_repo.dart';

part 'surah_state.dart';

class SurahCubit extends Cubit<SurahState> {
  SurahCubit(this.surahRepo) : super(SurahInitial());
  final SurahRepo surahRepo;
  Future<void> fetchBestSellerData() async {
    emit(SurahLoading());
    var result = await surahRepo.fetchSurah();
    result.fold((failure) {
      emit(SurahFailure(failure.errorMassage));
    }, (books) {
      emit(SurahSuccsess(books));
    });
}}
