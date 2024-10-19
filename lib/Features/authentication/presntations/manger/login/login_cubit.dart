import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:islami/Features/authentication/data/repo/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());
  final AuthRepo authRepo;
  Future<void> fetchLoginData(String email, String pass, ) async {
  emit(LoginLoading());
  
  
  final result = await authRepo.loginWithEmailAndPassword(email, pass);
  
  result.fold((failure) {
    emit(LoginFailure(failure.errorMassage));
  }, (user) {
    
    emit(LoginSuccess());
  });
}
}
