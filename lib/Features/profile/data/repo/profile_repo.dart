import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:islami/Features/authentication/data/model/user_model.dart';
import 'package:islami/core/errors/failure.dart';
import 'package:islami/core/errors/firebase_storage.dart';
import 'package:islami/core/errors/firestor.dart';

class ProfileRepo {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  Future<Either<Failure, UserModel>> uploadProfileImage(File imageFile, String uid) async {
    try {
      // رفع الصورة إلى Firebase Storage
      final storageRef = _firebaseStorage.ref().child('profile_images/$uid.jpg');
      await storageRef.putFile(imageFile);

      // الحصول على رابط الصورة
      final photoUrl = await storageRef.getDownloadURL();

      // تحديث رابط الصورة في Firestore
      await _firebaseFirestore.collection('user').doc(uid).update({
        'photoUrl': photoUrl,
      });

      // استرجاع بيانات المستخدم المحدثة من Firestore
      final updatedUserDoc = await _firebaseFirestore.collection('user').doc(uid).get();
      return right(UserModel.fromMap(updatedUserDoc.data()!));
    } catch (error) {
if (error is FirebaseException) {
        return Left(FirebaseStorageFailure.fromFirebaseCoreException(error));
      } else {
        return Left(FirebaseStorageFailure(error.toString()));
      }    }
  }
   Future<Either<Failure, File?>> pickImage() async {
    File? image;
    try {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        image = File(pickedFile.path);
        return right(image);
      }
      return left(Failure("Image picking failed"));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Future<Either<Failure, UserModel>> getUserData(String uid) async {
    final docSnapshot = await _firebaseFirestore.collection('user').doc(uid).get();
    try {
  if (docSnapshot.exists) {
    return right(UserModel.fromMap(docSnapshot.data()!)); 
    
  } else {
    throw Exception("User not found");
  }
}   catch (error) {
 if (error is FirebaseException) {
        return left(CloudFirestoreFailure.fromFirebaseCoreException(error));
      } else {
        return left(Failure (error.toString()));
      }
}
  }
}
