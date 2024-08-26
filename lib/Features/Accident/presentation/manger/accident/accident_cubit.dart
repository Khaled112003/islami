import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:islami/Features/Accident/data/models/accident_model/accident_model.dart';
import 'package:islami/Features/Accident/data/repo/accident_repo.dart';

part 'accident_state.dart';

class AccidentCubit extends Cubit<AccidentState> {
  AccidentCubit(this.accidentRepo) : super(AccidentInitial()) {
    currentHadithIndex = 1; 
  }

  final AccidentRepo accidentRepo;
  int currentHadithIndex = 1; 

  Future<void> fetchHadithData() async {
    emit(AccidentLoading());
    var result = await accidentRepo.fetchHadithByIndex(
        currentHadithIndex - 1); // تحويل الفهرس ليتناسب مع التعديل
    result.fold(
      (fail) => emit(AccidentFailure(errorMassage: fail.errorMassage)),
      (hadith) => emit(
          AccidentSuccess(hadith as List<AccidentModel>, currentHadithIndex)),
    );
  }

  void getNextHadith() {
    if (state is AccidentSuccess) {
      var maxIndex = (state as AccidentSuccess).hadith.length;
      if (currentHadithIndex < maxIndex) {
        currentHadithIndex++;
        fetchHadithData();
      }
    }
  }

  void getPreviousHadith() {
    if (currentHadithIndex > 1) {
      // التحقق من أن الفهرس أكبر من 1
      currentHadithIndex--;
      fetchHadithData();
    }
  }
}
