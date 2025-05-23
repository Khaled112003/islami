import 'package:firebase_auth/firebase_auth.dart';
import 'package:islami/core/errors/failure.dart';


class FirebaseAuthFailure extends Failure {
  FirebaseAuthFailure(super.errorMessage);

  factory FirebaseAuthFailure.fromFirebaseAuthException(
      FirebaseAuthException exception) {
    switch (exception.code) {
      case 'invalid-email':
        return FirebaseAuthFailure('Invalid email address');
      case 'user-not-found':
        return FirebaseAuthFailure('User not found');
      case 'wrong-password':
        return FirebaseAuthFailure('Wrong password');
      case 'user-disabled':
        return FirebaseAuthFailure('User account is disabled');
      case 'email-already-in-use':
        return FirebaseAuthFailure('Email is already in use');
      case 'operation-not-allowed':
        return FirebaseAuthFailure('Operation not allowed');
      case 'too-many-requests':
        return FirebaseAuthFailure('Too many login attempts. Please try again later.');
      default:
        print('Unhandled FirebaseAuthException: ${exception.code} - ${exception.message}');
        return FirebaseAuthFailure(
            'An unknown error occurred please try again');
    }
  }
}



