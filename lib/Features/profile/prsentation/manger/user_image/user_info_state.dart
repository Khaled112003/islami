part of 'user_info_cubit.dart';

sealed class UserImageState extends Equatable {
  const UserImageState();

  @override
  List<Object> get props => [];
}

final class UserInfoInitial extends UserImageState {}
