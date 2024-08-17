import 'package:flutter_bloc/flutter_bloc.dart';

class TasbihCubit extends Cubit<int> {
  TasbihCubit() : super(0);

  int pressCount = 0; 
  String currentText = "الحمد لله"; 

  void AddingNumbers() {
    if (state < 33) {
      emit(state + 1);
    } else {
      emit(0); 
      pressCount++;
      _changeText(); 
    }
  }

  void restart() {
    emit(0);
    pressCount = 0;
    currentText = "الحمد لله"; 
  }

  void _changeText() {
    if (pressCount == 1) {
      currentText = "سبحان الله";
    } else if (pressCount == 2) {
      currentText = "الله أكبر";
    } else {
      pressCount = 0; 
      currentText = "الحمد لله";
    }
  }
}