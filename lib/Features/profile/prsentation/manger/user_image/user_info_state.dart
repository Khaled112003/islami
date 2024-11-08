part of 'user_info_cubit.dart';

sealed class UserImageState extends Equatable {
  const UserImageState();

  @override
  List<Object> get props => [];
}

final class UserInfoInitial extends UserImageState {}
class UploadProfileImageSuccess extends UserImageState {
  final UserModel imageUrl;

 const UploadProfileImageSuccess(this.imageUrl);
}

class UploadProfileImageFailure extends UserImageState {
  final String errorMessage;

 const UploadProfileImageFailure(this.errorMessage);
}

class UploadProfileImageLoading extends UserImageState {}

class PickImageSuccess extends UserImageState {
  final File? image;
 const PickImageSuccess(this.image);
}