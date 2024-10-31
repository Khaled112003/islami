part of 'email_verification_cubit.dart';

sealed class EmailVerificationState extends Equatable {
  const EmailVerificationState();

  @override
  List<Object> get props => [];
}

final class EmailVerificationInitial extends EmailVerificationState {}
final class EmailVerificationLoading extends EmailVerificationState {}
final class EmailVerificationSuccsess extends EmailVerificationState {}
final class EmailVerificationFailure extends EmailVerificationState {
  final String errorMessage;

  EmailVerificationFailure( this.errorMessage);
}
