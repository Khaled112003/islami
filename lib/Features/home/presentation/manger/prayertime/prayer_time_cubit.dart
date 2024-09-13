import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:islami/Features/home/data/repo/prayer_time_repo.dart';
import 'package:islami/core/utilitis/shared_Preferences.dart';
import '../../../data/model/prayer_time_model/prayer_time_model.dart';


part 'prayer_time_state.dart';

class PrayerTimeCubit extends Cubit<PrayerTimeState> {
  PrayerTimeCubit(this.prayerTimeRepo) : super(PrayerTimeInitial());

  final PrayerTimeRepo prayerTimeRepo;

  Future<void> fetchPrayerData() async {
    if (isClosed) return;  
    try {
      emit(PrayerTimeloading());

      // تحقق من البيانات المخزنة مؤقتاً أولاً
      List<Map<String, dynamic>>? cachedPrayerTimes = SharedPrefsHelper.getData("prayer_time_list");

      if (cachedPrayerTimes != null) {
        // تحويل البيانات المخزنة إلى نماذج PrayerTimeModel
        List<PrayerTimeModel> prayerTimes = cachedPrayerTimes.map((e) => PrayerTimeModel.fromJson(e)).toList();
        emit(PrayerTimesuccsess(prayerTimes));
      } else {
        // جلب البيانات من API إذا لم يكن هناك بيانات مخزنة
        var result = await prayerTimeRepo.fetchPrayerTime();
        if (isClosed) return;  
        result.fold(
          (fail) => emit(PrayerTimefailure(fail.errorMassage)),
          (adhan) {
            // تخزين البيانات التي تم جلبها في SharedPreferences
            SharedPrefsHelper.saveData("prayer_time_list", adhan.map((e) => e.toJson()).toList());
            emit(PrayerTimesuccsess(adhan));
          },
        );
      }
    } catch (e) {
      if (isClosed) return;  
      emit(const PrayerTimefailure('حدث خطأ غير متوقع.'));
    }
  }

  Future<void> clearCache() async {
    await SharedPrefsHelper.clear();
  }
}
