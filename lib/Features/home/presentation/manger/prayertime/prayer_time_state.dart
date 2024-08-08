// ignore_for_file: must_be_immutable

part of 'prayer_time_cubit.dart';

sealed class PrayerTimeState extends Equatable {
  const PrayerTimeState();

  @override
  List<Object> get props => [];
}

final class PrayerTimeInitial extends PrayerTimeState {}

final class PrayerTimeloading extends PrayerTimeState {}

final class PrayerTimefailure extends PrayerTimeState {
  final String errorMassage;

  const PrayerTimefailure(this.errorMassage);
}

final class PrayerTimesuccses extends PrayerTimeState {
  List<PrayerTimeModel> Adhan;
  PrayerTimesuccses(this.Adhan);
}
