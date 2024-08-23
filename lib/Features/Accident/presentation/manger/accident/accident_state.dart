part of 'accident_cubit.dart';

abstract class AccidentState extends Equatable {
  const AccidentState();

  @override
  List<Object> get props => [];
}

class AccidentInitial extends AccidentState {}

class AccidentLoading extends AccidentState {}

class AccidentFailure extends AccidentState {
  final String errorMassage;

  const AccidentFailure({required this.errorMassage});

  @override
  List<Object> get props => [errorMassage];
}

class AccidentSuccess extends AccidentState {
  final List<AccidentModel> hadith;
  final int currentHadithIndex;

  const AccidentSuccess(this.hadith, this.currentHadithIndex);

  @override
  List<Object> get props => [hadith, currentHadithIndex];
}
