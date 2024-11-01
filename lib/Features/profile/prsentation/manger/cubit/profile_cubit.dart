import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/Features/profile/data/repo/profile_repo.dart';
import 'package:islami/Features/profile/prsentation/manger/cubit/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo profileRepo;

  ProfileCubit(this.profileRepo) : super(ProfileInitial());

  // جلب بيانات المستخدم من Firestore
  Future<void> fetchUserData(String uid) async {
    emit(ProfileLoading());
    try {
      final user = await profileRepo.getUserData(uid);
      emit(ProfileLoaded(user));
    } catch (e) {
      emit(ProfileError("Failed to load user data"));
    }
  }

  // تحميل صورة الملف الشخصي ورفعها إلى Firebase Storage
  Future<void> uploadProfileImage(File imageFile, String uid) async {
    emit(ProfileImageUploading());
    try {
      final photoUrl = await profileRepo.uploadProfileImage(imageFile, uid);
      if (photoUrl != null) {
        emit(ProfileImageUploaded(photoUrl));
      } else {
        emit(ProfileError("Failed to upload image"));
      }
    } catch (e) {
      emit(ProfileError("Failed to upload image"));
    }
  }
}
