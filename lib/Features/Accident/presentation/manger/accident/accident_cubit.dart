import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:islami/Features/Accident/data/models/accident_model/accident_model.dart';
import 'package:islami/Features/Accident/data/repo/accident_repo.dart';

part 'accident_state.dart';

class AccidentCubit extends Cubit<AccidentState> {
  AccidentCubit(this.accidentRepo) : super(AccidentInitial());

  final AccidentRepo accidentRepo;
  int currentHadithIndex = 1;

  Future<void> fetchHadithData() async {
    emit(AccidentLoading());
    var result = await accidentRepo.fetchHadithByIndex(currentHadithIndex);
    result.fold(
      (fail) => emit(AccidentFailure(errorMassage: fail.errorMassage)),
      (hadith) => emit(AccidentSuccess(hadith, currentHadithIndex)), 
    );
  }

  void getNextHadith() {
    currentHadithIndex++;
    fetchHadithData();
  }

  void getPreviousHadith() {
    if (currentHadithIndex > 1) {
      currentHadithIndex--;
      fetchHadithData();
    }
  }
}
