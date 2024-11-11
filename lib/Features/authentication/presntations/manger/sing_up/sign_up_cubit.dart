import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:islami/Features/authentication/data/model/user_model.dart';
import 'package:islami/Features/authentication/data/repo/auth_repo.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.authRepo) : super(SignUpInitial());
  final AuthRepo authRepo;
  Future<void> fetchData(String email, String pass, String userName) async {
  emit(SignUpLoading());
  
  final result = await authRepo.signUpWithEmailAndPass(email, userName, pass);
  
  result.fold((failure) {
    emit(SignUpFailure(failure.errorMassage));
  }, (user) {
    emit(SignUpSuccsess(user));
  });
}
}
