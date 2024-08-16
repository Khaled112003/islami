import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tasbih_state.dart';

class TasbihCubit extends Cubit<TasbihState> {
  TasbihCubit() : super(TasbihInitial());
  int x=0;
  int AddingNumbers(){
    if(x<=33) {
      x++;
    } 
    return x;
    

  
}

}

