import 'package:islami/Features/Accident/data/models/doaa/doaa_model.dart';

abstract class DoaaState {}

class DoaaInitial extends DoaaState {}

class DoaaLoading extends DoaaState {}

class DoaaSuccess extends DoaaState {
  final List<DoaaModel> doaaList;
 final int currentHadithIndex;
  DoaaSuccess(this.doaaList, this.currentHadithIndex);
}

class DoaaFailure extends DoaaState {
  final String errorMessage;

  DoaaFailure({required this.errorMessage});
}
