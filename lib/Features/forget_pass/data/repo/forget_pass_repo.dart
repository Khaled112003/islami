import 'package:firebase_auth/firebase_auth.dart';

class ForgetPassRepo {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Future<void> signUpWithEmailAndPass(String email) async {
    try {
       await _firebaseAuth.sendPasswordResetEmail(
        email: email,
      );
    } catch (error) {
      throw Exception('Failed to send reset email: $error');
    }
  }
}
