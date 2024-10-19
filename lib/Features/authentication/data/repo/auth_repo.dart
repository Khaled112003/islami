import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:islami/Features/authentication/data/model/user_model.dart';
import 'package:islami/core/errors/failure.dart';
import 'package:islami/core/errors/firebase_auth_errors.dart';
import 'package:islami/core/errors/firestor.dart';

class AuthRepo {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<Either<Failure, UserModel>> signUpWithEmailAndPass(
      String email, String userName, String password) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      final user = credential.user;
      
      if (user != null) {
        final newUser = UserModel(uid: user.uid, username: userName, email: email);
        await saveData(newUser);
        return Right(newUser);  
      } else {
        return Left(FirebaseAuthFailure('User is null'));
      }
    } catch (error) {
      if (error is FirebaseAuthException) {
        return Left(FirebaseAuthFailure.fromFirebaseAuthException(error));
      } else if (error is FirebaseException) {
        return Left(CloudFirestoreFailure.fromFirebaseCoreException(error));
      } else {
        return Left(FirebaseAuthFailure(error.toString()));
      }
    }
  }

  Future<void> saveData(UserModel user) async {
    final userCollection = _firebaseFirestore.collection('user');
    await userCollection.doc(user.uid).set(user.toMap());
  }

  Future<Either<Failure, UserCredential>> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
     return Right(credential);
      
     
    } catch (error) {
      if (error is FirebaseAuthException) {
        return Left(FirebaseAuthFailure.fromFirebaseAuthException(error));
      } else if (error is FirebaseException) {
        return Left(CloudFirestoreFailure.fromFirebaseCoreException(error));
      } else {
        return Left(FirebaseAuthFailure(error.toString()));
      }
    }
  }
}

