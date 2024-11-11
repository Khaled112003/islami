import 'package:equatable/equatable.dart';
import 'package:islami/Features/authentication/data/model/user_model.dart';

abstract class InfoState extends Equatable {
  const InfoState();

  @override
  List<Object?> get props => [];
}
class InfoInitial extends InfoState {}

class InfoLoading extends InfoState {}

class InfoSuccess extends InfoState {
 final UserModel user;
 const InfoSuccess(this.user);
}

class InfoFailure extends InfoState {
  final String errorMessage;

const  InfoFailure( this.errorMessage);
}




















// class ProfiInitial extends InfoState {}

// class ProfileLoading extends InfoState {}

// class ProfileLoaded extends InfoState {
//   final UserModel user;
//   const ProfileLoaded(this.user);

//   @override
//   List<Object?> get props => [user];
// }

// class ProfileImageUploading extends InfoState {}

// class ProfileImageUploaded extends InfoState {
//   final String photoUrl;
//   const ProfileImageUploaded(this.photoUrl);

//   @override
//   List<Object?> get props => [photoUrl];
// }

// class ProfileError extends InfoState {
//   final String message;
//   const ProfileError(this.message);

//   @override
//   List<Object?> get props => [message];
// }
