import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:islami/Features/authentication/data/model/user_model.dart';

class ProfileRepo {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  // دالة لرفع صورة الملف الشخصي
  Future<String?> uploadProfileImage(File imageFile, String uid) async {
    try {
      final storageRef = _firebaseStorage.ref().child('profile_images/$uid.jpg');
      await storageRef.putFile(imageFile);
      return await storageRef.getDownloadURL();
    } catch (e) {
      print("Error uploading image: $e");
      return null;
    }
  }

  // دالة لاسترجاع بيانات المستخدم من Firestore
  Future<UserModel> getUserData(String uid) async {
    final docSnapshot = await _firebaseFirestore.collection('user').doc(uid).get();
    if (docSnapshot.exists) {
      return UserModel.fromMap(docSnapshot.data()!);
    } else {
      throw Exception("User not found");
    }
  }
}
