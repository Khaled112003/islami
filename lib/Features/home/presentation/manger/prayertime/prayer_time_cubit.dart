import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:islami/Features/home/data/repo/prayer_time_repo.dart';
import '../../../data/model/prayer_time_model/prayer_time_model.dart';

part 'prayer_time_state.dart';

class PrayerTimeCubit extends Cubit<PrayerTimeState> {
  PrayerTimeCubit(this.prayerTimeRepo) : super(PrayerTimeInitial());

  final PrayerTimeRepo prayerTimeRepo;

 Future<void> fetchPrayerData() async {
  if (isClosed) return;  
  try {
    emit(PrayerTimeloading());
    var result = await prayerTimeRepo.fetchPrayerTime();
    if (isClosed) return;  
    result.fold(
      (fail) => emit(PrayerTimefailure(fail.errorMassage)),
      (adhan) => emit(PrayerTimesuccsess(adhan)),
    );
  } catch (e) {
    if (isClosed) return;  
    emit(const PrayerTimefailure('حدث خطأ غير متوقع.'));
  }
}
}
