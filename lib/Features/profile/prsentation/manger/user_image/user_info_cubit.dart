import 'dart:io'; // استيراد مكتبة إدارة الملفات

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:islami/Features/profile/data/repo/profile_repo.dart';

part 'user_info_state.dart';

class UserImageCubit extends Cubit<UserImageState> {
  UserImageCubit(this.profilerepo) : super(UserInfoInitial());

  String imageStringUrl = '';
  final ProfileRepo profilerepo;
  File? image;

  Future<void> pickImage() async {
    var result = await profilerepo.pickImage();
    result.fold(
      (failure) {
        emit(UploadProfileImageFailure(failure.errorMassage));
      },
      (imageFile) {
        if (imageFile != null) {
          image = File(imageFile.path); // التأكد من استخدام io.File
          emit(PickImageSuccess(image!));
        } else {
          emit(UploadProfileImageFailure('Image picking failed.'));
        }
      },
    );
  }

  Future<void> uploadProfileImage(String uid) async {
    if (image == null) {
      emit(UploadProfileImageFailure('No image selected.'));
      return;
    }
    emit(UploadProfileImageLoading());
    var response = await profilerepo.uploadProfileImage(image!, uid);
    response.fold(
      (failure) {
        emit(UploadProfileImageFailure(failure.errorMassage));
      },
      (imageUrl) {
        imageStringUrl = imageUrl as String;
        emit(UploadProfileImageSuccess(imageStringUrl));
      },
    );
  }
}