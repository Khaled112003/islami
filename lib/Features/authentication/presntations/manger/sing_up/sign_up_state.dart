part of 'sign_up_cubit.dart';

sealed class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object> get props => [];
}

final class SignUpInitial extends SignUpState {}
final class SignUpLoading extends SignUpState {}
final class SignUpFailure extends SignUpState {
  final String errorMessage;
  SignUpFailure( this.errorMessage);
}
final class SignUpSuccsess extends SignUpState {
  final UserModel user;
  SignUpSuccsess( this.user);

}

