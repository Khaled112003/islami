import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:islami/Features/Accident/data/models/accident_model/accident_model.dart';
import 'package:islami/Features/Accident/data/repo/accident_repo.dart';

part 'accident_state.dart';

class AccidentCubit extends Cubit<AccidentState> {
  AccidentCubit(this.accidentRepo) : super(AccidentInitial());
  AccidentRepo accidentRepo;
  Future<void> fetchPrayerData() async {
    emit(Accidentloaing());
    var result = await accidentRepo.fetchAccidents();
    result.fold(
      (fail) => emit(Accidentfailure(errorMassage: fail.errorMassage)),
      (hades) => emit(
        Accidentsuccsec(hades),
      ),
    );
  }
}
