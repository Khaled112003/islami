part of 'accident_cubit.dart';

sealed class AccidentState extends Equatable {
  const AccidentState();

  @override
  List<Object> get props => [];
}

final class AccidentInitial extends AccidentState {}
final class Accidentloaing extends AccidentState {}
final class Accidentfailure extends AccidentState {
  final String errorMassage;

  Accidentfailure({required this.errorMassage});
}
// ignore: must_be_immutable
final class Accidentsuccsec extends AccidentState {
  List<AccidentModel> hades;
  Accidentsuccsec(this.hades);

}
