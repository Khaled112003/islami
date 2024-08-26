import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'doaa_state.dart';

class DoaaCubit extends Cubit<DoaaState> {
  DoaaCubit() : super(DoaaInitial());
}
