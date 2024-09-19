part of 'surah_cubit.dart';

sealed class SurahState extends Equatable {
  const SurahState();

  @override
  List<Object> get props => [];
}

final class SurahInitial extends SurahState {}

final class SurahLoading extends SurahState {}

final class SurahFailure extends SurahState {
  final String errorMassage;

  const SurahFailure(this.errorMassage);
}

final class SurahSuccess extends SurahState {
  final List<SurahModel> allSurahs;
  final List<SurahModel> filteredSurahs;

  const SurahSuccess(this.allSurahs, this.filteredSurahs);

  @override
  List<Object> get props => [allSurahs, filteredSurahs];
}
