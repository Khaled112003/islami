
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:islami/core/errors/failure.dart';
import 'package:islami/core/errors/firebase_auth_errors.dart';

class ForgetPassRepo {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<Either<Failure, void>> sendPasswordResetEmail(String email) async {
  try {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
    print('Password reset email sent successfully');
    return Right(null);
  } on FirebaseAuthException catch (error) {
    if (error.code == 'user-not-found') {
      print('No user found for that email.');
      return Left(FirebaseAuthFailure('No user found for that email.'));
    }
    return Left(FirebaseAuthFailure.fromFirebaseAuthException(error));
  } catch (error) {
    print('Error sending password reset email: ${error.toString()}');
    return Left(FirebaseAuthFailure(error.toString()));
  }
}
}
