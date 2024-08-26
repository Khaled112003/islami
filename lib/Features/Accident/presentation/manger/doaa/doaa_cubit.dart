import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:islami/Features/Accident/data/models/doaa/doaa_model.dart';
import 'package:islami/Features/Accident/data/repo/doaaa.dart';

part 'doaa_state.dart';

class DoaaCubit extends Cubit<DoaaState> {
  DoaaCubit(this.doaaRepo) : super(DoaaInitial()) {
    currentHadithIndex = 1; 
  }

  final DoaaRepo doaaRepo;
  int currentHadithIndex = 1; 

  Future<void> fetchHadithData() async {
    emit(DoaaLoading());
    var result = await doaaRepo.fetchHadithByIndex(
        currentHadithIndex - 1); 
    result.fold(
      (fail) => emit(DoaaFailure(errorMassage: fail.errorMassage)),
      (hadith) => emit(
          DoaaSuccess(hadith as List<DoaaModel>, currentHadithIndex)),
    );
  }

  void getNextHadith() {
    if (state is DoaaSuccess) {
      var maxIndex = (state as DoaaSuccess).hadith.length;
      if (currentHadithIndex < maxIndex) {
        currentHadithIndex++;
        fetchHadithData();
      }
    }
  }

  void getPreviousHadith() {
    if (currentHadithIndex > 1) {
      currentHadithIndex--;
      fetchHadithData();
    }
  }
}