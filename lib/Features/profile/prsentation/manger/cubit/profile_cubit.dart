import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:islami/Features/profile/data/repo/profile_repo.dart';
import 'package:islami/Features/profile/prsentation/manger/cubit/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo profileRepo;

  ProfileCubit(this.profileRepo) : super(ProfileInitial());

  Future<void> fetchUserData(String uid) async {
    emit(ProfileLoading());
    try {
      final user = await profileRepo.getUserData(uid);
      emit(ProfileLoaded(user));
    } catch (e) {
      emit(ProfileError("Failed to load user data"));
    }
  }

  Future<void> pickAndUploadImage(String uid) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      final imageFile = File(pickedImage.path);
      emit(ProfileImageUploading()); // ابدأ التحميل هنا
      await uploadProfileImage(imageFile, uid);
    } else {
      emit(ProfileError("No image selected"));
    }
  }

  Future<void> uploadProfileImage(File imageFile, String uid) async {
    try {
      final updatedUser = await profileRepo.uploadProfileImage(imageFile, uid);
      if (updatedUser != null) {
        emit(ProfileLoaded(updatedUser)); 
      } else {
        emit(ProfileError("Failed to upload image"));
      }
    } catch (e) {
      emit(ProfileError("Failed to upload image"));
    }
  }
}
