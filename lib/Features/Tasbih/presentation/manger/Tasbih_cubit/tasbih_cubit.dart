import 'package:flutter_bloc/flutter_bloc.dart';

class TasbihCubit extends Cubit<int> {
  TasbihCubit() : super(0); 

  void AddingNumbers() {
    if (state < 33) {
      emit(state + 1); 
    }
  }
    void restart() {
   
      emit(0 ); 
    
  }
}