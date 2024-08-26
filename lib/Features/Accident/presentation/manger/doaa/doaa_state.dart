part of 'doaa_cubit.dart';

sealed class DoaaState extends Equatable {
  const DoaaState();

  @override
  List<Object> get props => [];
}

class DoaaInitial extends DoaaState {}

class DoaaLoading extends DoaaState {}

class DoaaFailure extends DoaaState {
  final String errorMassage;

  const DoaaFailure({required this.errorMassage});

  @override
  List<Object> get props => [errorMassage];
}

class DoaaSuccess extends DoaaState {
  final List<DoaaModel> hadith;
  final int currentHadithIndex;

  const DoaaSuccess(this.hadith, this.currentHadithIndex);

  @override
  List<Object> get props => [hadith, currentHadithIndex];
}
