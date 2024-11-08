import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_info_state.dart';

class UserImageCubit extends Cubit<UserImageState> {
  UserImageCubit() : super(UserInfoInitial());
}
