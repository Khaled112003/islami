// ayat_state.dart
part of 'ayat_cubit.dart';

sealed class AyatState extends Equatable {
  const AyatState();

  @override
  List<Object> get props => [];
}

final class AyatInitial extends AyatState {}

final class AyatLoading extends AyatState {}

final class AyatFailure extends AyatState {
  final String errorMassage;

  const AyatFailure(this.errorMassage);

  @override
  List<Object> get props => [errorMassage];
}

final class AyatSuccsess extends AyatState {
  final List<Ayah> ayat;

  const AyatSuccsess(this.ayat);

  @override
  List<Object> get props => [ayat];
}
