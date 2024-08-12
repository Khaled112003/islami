import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:islami/Features/home/data/repo/prayer_time_repo.dart';

import '../../../data/model/prayer_time_model/prayer_time_model.dart';

part 'prayer_time_state.dart';

class PrayerTimeCubit extends Cubit<PrayerTimeState> {
  PrayerTimeCubit(this.prayerTimeRepo) : super(PrayerTimeInitial());
  PrayerTimeRepo prayerTimeRepo;
  Future<void> fetchPrayerData() async {
    emit(PrayerTimeloading());
    var result = await prayerTimeRepo.fetchPrayerTime();
    result.fold(
      (fail) => 
      
      emit(
        PrayerTimefailure(fail.errorMassage),
      ),
      (Adhan) => emit(
        PrayerTimesuccsess(Adhan),
      ),
    );
  }
}
