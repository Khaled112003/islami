import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:islami/Features/authentication/data/repo/auth_repo.dart';
import 'package:islami/core/errors/firebase_auth_errors.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());
  final AuthRepo authRepo;
  Future<void> fetchLoginData(String email, String pass) async {
    emit(LoginLoading());

    try {
      final result = await authRepo.loginWithEmailAndPassword(email, pass);

      result.fold(
        (failure) {
          emit(LoginFailure(failure.errorMassage));
        },
        (user) {
          emit(LoginSuccess());
        },
      );
    } on FirebaseAuthException catch (e) {
      final failure = FirebaseAuthFailure.fromFirebaseAuthException(e);
      emit(LoginFailure(failure.errorMassage));
    } catch (error) {
      emit(LoginFailure('An unexpected error occurred. Please try again.'));
    }
  }
}
