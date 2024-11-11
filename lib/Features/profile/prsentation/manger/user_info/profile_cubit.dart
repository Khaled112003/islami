import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/Features/profile/data/repo/profile_repo.dart';
import 'package:islami/Features/profile/prsentation/manger/user_info/profile_state.dart';

class InfoCubit extends Cubit<InfoState> {
  final ProfileRepo profileRepo;

  InfoCubit(this.profileRepo) : super(InfoInitial());

  Future<void> fetchUserData(String uid) async {
    emit(InfoLoading());

    final result = await profileRepo.getUserData(uid);
    result.fold(
      (failure) {
        emit(InfoFailure(failure.errorMassage));
      },
      (user) {
        emit(InfoSuccess(user));
      },
    );
  }
}
