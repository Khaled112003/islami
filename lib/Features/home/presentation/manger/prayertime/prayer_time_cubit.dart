import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:islami/Features/home/data/repo/prayer_time_repo.dart';
import '../../../data/model/prayer_time_model/prayer_time_model.dart';

part 'prayer_time_state.dart';

class PrayerTimeCubit extends Cubit<PrayerTimeState> {
  PrayerTimeCubit(this.prayerTimeRepo) : super(PrayerTimeInitial());

  final PrayerTimeRepo prayerTimeRepo;

  Future<void> fetchPrayerData() async {
    try {
      emit(PrayerTimeloading());
      var result = await prayerTimeRepo.fetchPrayerTime();
      result.fold(
        (fail) => emit(PrayerTimefailure(fail.errorMassage)),
        (adhan) => emit(PrayerTimesuccsess(adhan)),
      );
    } catch (e) {
      // التعامل مع الأخطاء الأخرى
      emit(PrayerTimefailure('حدث خطأ غير متوقع.'));
    }
  }

  @override
  Future<void> close() {
    // هنا يمكن إضافة عمليات التنظيف إذا لزم الأمر
    return super.close();
  }
}
