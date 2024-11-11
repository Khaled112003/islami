part of 'user_info_cubit.dart';

sealed class UserImageState extends Equatable {
  const UserImageState();

  @override
  List<Object> get props => [];
}

final class UserInfoInitial extends UserImageState {}

class UploadProfileImageSuccess extends UserImageState {
  final String imageUrl; // تم تغيير النوع إلى String

  const UploadProfileImageSuccess(this.imageUrl);

  @override
  List<Object> get props => [imageUrl];
}

class UploadProfileImageFailure extends UserImageState {
  final String errorMessage;

  const UploadProfileImageFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class UploadProfileImageLoading extends UserImageState {}

class PickImageSuccess extends UserImageState {
  final File? image;

  const PickImageSuccess(this.image);

  @override
  List<Object> get props => [image!];
}