part of 'accident_cubit.dart';

sealed class AccidentState extends Equatable {
  const AccidentState();

  @override
  List<Object> get props => [];
}

final class AccidentInitial extends AccidentState {}
final class AccidentLoading extends AccidentState {}
final class AccidentFailure extends AccidentState {
  final String errorMassage;

  AccidentFailure({required this.errorMassage});
}
// ignore: must_be_immutable
final class AccidentSuccess extends AccidentState {
  List<AccidentModel> hadith;
  AccidentSuccess(this.hadith);

}
