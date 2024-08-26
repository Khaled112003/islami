import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:islami/Features/Accident/data/repo/doaaa_repo.dart';
import 'package:islami/Features/Accident/presentation/manger/doaa/doaa_state.dart';


class DoaaCubit extends Cubit<DoaaState> {
  DoaaCubit(this.doaaRepository) : super(DoaaInitial());

  final DoaaRepository doaaRepository;
  int currentDoaaIndex = 0;

  Future<void> fetchDoaaData() async {
    emit(DoaaLoading());
    var result = await doaaRepository.fetchDoaaCollection(currentDoaaIndex) ;
    result.fold(
      (failure) => emit(DoaaFailure(errorMessage: failure.errorMassage)),
      (doaaList) => emit(DoaaSuccess(doaaList,currentDoaaIndex)),
    );
  }

  void getNextDoaa() {
    if (state is DoaaSuccess) {
      var maxIndex = (state as DoaaSuccess).doaaList.length;
      if (currentDoaaIndex < maxIndex) {
        currentDoaaIndex++;
        fetchDoaaData();
      }
    }
  }

  void getPreviousDoaa() {
   if (currentDoaaIndex > 1) {
      
      currentDoaaIndex--;
      fetchDoaaData();
}
  }}