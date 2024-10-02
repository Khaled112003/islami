import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:islami/Features/Accident/data/models/accident_model/accident_model.dart';
import 'package:islami/Features/Accident/data/repo/accident_repo.dart';
import 'package:islami/core/utilitis/shared_Preferences.dart'; // تأكد من استيراد SharedPrefsHelper

part 'accident_state.dart';

class AccidentCubit extends Cubit<AccidentState> {
  AccidentCubit(this.accidentRepo) : super(AccidentInitial()) {
    currentHadithIndex = 1;
    _initialize();
  }

  final AccidentRepo accidentRepo;
  int currentHadithIndex = 1;

  Future<void> _initialize() async {
    await SharedPrefsHelper.init();
    await _loadCachedHadith();
  }

  Future<void> _loadCachedHadith() async {
    final cachedHadith = SharedPrefsHelper.getData("cached_hadith");
    if (cachedHadith != null && cachedHadith.isNotEmpty) {
      if (isClosed)
        return; // تأكد من عدم محاولة إرسال حالة جديدة بعد إغلاق الـ Cubit
      emit(AccidentSuccess(
        cachedHadith.map((json) => AccidentModel.fromJson(json)).toList(),
        currentHadithIndex,
      ));
    } else {
      await fetchHadithData();
    }
  }

  Future<void> fetchHadithData() async {
    if (isClosed)
      return; // تأكد من عدم محاولة إرسال حالة جديدة بعد إغلاق الـ Cubit
    emit(AccidentLoading());

    try {
      var result =
          await accidentRepo.fetchHadithByIndex(currentHadithIndex - 1);
      result.fold(
        (fail) {
          if (!isClosed) {
            emit(AccidentFailure(errorMassage: fail.errorMassage));
          }
        },
        (hadith) {
          if (!isClosed) {
            // Cache the fetched hadith data
            final hadithJson = hadith.map((h) => h.toJson()).toList();
            SharedPrefsHelper.saveData("cached_hadith", hadithJson);
            emit(AccidentSuccess(hadith, currentHadithIndex));
          }
        },
      );
    } catch (e) {
      if (!isClosed) {
        emit(AccidentFailure(errorMassage: 'حدث خطأ غير متوقع.'));
      }
    }
  }

  void getNextHadith() {
    if (state is AccidentSuccess) {
      var maxIndex = (state as AccidentSuccess).hadith.length;
      if (currentHadithIndex < maxIndex) {
        currentHadithIndex++;
        fetchHadithData();
      }
    }
  }

  void getPreviousHadith() {
    if (currentHadithIndex > 1) {
      currentHadithIndex--;
      fetchHadithData();
    }
  }

  Future<void> clearCache() async {
    await SharedPrefsHelper.clear();
  }
}
