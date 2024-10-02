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

      List<Map<String, dynamic>>? cachedPrayerTimes =
          SharedPrefsHelper.getData("prayer_time_list");
      int? lastUpdated =
          SharedPrefsHelper.getLastUpdatedTimestamp("prayer_time_list");

      if (cachedPrayerTimes != null && lastUpdated != null) {
        final int currentTime = DateTime.now().millisecondsSinceEpoch;
        final int oneDayInMillis = 24 * 60 * 60 * 1000;

        if (currentTime - lastUpdated < oneDayInMillis) {
          List<PrayerTimeModel> prayerTimes = cachedPrayerTimes
              .map((e) => PrayerTimeModel.fromJson(e))
              .toList();
          emit(PrayerTimesuccsess(prayerTimes));
          return;
        }
      }

      var result = await prayerTimeRepo.fetchPrayerTime();
      if (isClosed) return;
      result.fold(
        (fail) => emit(PrayerTimefailure(fail.errorMassage)),
        (adhan) {
          SharedPrefsHelper.saveData(
              "prayer_time_list", adhan.map((e) => e.toJson()).toList());
          emit(PrayerTimesuccsess(adhan));
        },
      );
    } catch (e) {
      if (isClosed) return;
      emit(const PrayerTimefailure('حدث خطأ غير متوقع.'));
    }
  }

  Future<void> clearCache() async {
    await SharedPrefsHelper.clear();
  }
}
