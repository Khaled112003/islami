import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:islami/Features/authentication/data/model/user_model.dart';

class ProfileRepo {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  Future<UserModel?> uploadProfileImage(File imageFile, String uid) async {
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
      return UserModel.fromMap(updatedUserDoc.data()!);
    } catch (e) {
      print("Error uploading image or updating Firestore: $e");
      return null;
    }
  }

  Future<UserModel> getUserData(String uid) async {
    final docSnapshot = await _firebaseFirestore.collection('user').doc(uid).get();
    if (docSnapshot.exists) {
      return UserModel.fromMap(docSnapshot.data()!);
    } else {
      throw Exception("User not found");
    }
  }
}
