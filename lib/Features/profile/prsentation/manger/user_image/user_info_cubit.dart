import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_cache_manager/file.dart';
import 'package:islami/Features/authentication/data/model/user_model.dart';
import 'package:islami/Features/profile/data/repo/profile_repo.dart';

part 'user_info_state.dart';

class UserImageCubit extends Cubit<UserImageState> {
  UserImageCubit(this.profilerepo) : super(UserInfoInitial());
  String imageStringUrl = '';
  File? image;
  final ProfileRepo profilerepo;
  Future<void> pickImage()async{
    var result =await profilerepo.pickImage();
    result.fold((failure) {
      emit(UploadProfileImageFailure(failure.errorMassage));
    }, (imageFile) {
      image = imageFile as File?;
      emit(PickImageSuccess(imageFile));
    });

  }

  Future<void>uploadProfileImage(String uid)async{
    var response= await profilerepo.uploadProfileImage(image!, uid);
    response.fold(
      (failure) => emit(UploadProfileImageFailure(failure.errorMassage)),
      (imageUrl) {
        imageStringUrl = imageUrl as String;
        emit(UploadProfileImageSuccess(imageUrl));
      },
    );
  }
}
