import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:islami/Features/forget_pass/data/repo/forget_pass_repo.dart';

part 'email_verification_state.dart';

class EmailVerificationCubit extends Cubit<EmailVerificationState> {
  EmailVerificationCubit(this.forgetPassRepo) : super(EmailVerificationInitial());
  final ForgetPassRepo forgetPassRepo;
  Future <void>sendEmailVerification(final String email)async{
   var result= await forgetPassRepo.sendPasswordResetEmail(email);
    result.fold((failure) {
      emit(EmailVerificationFailure(failure.errorMassage));
    }, (r) {
      emit(EmailVerificationSuccsess());
    },);
    

  }
}
