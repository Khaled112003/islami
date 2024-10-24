import 'package:firebase_auth/firebase_auth.dart';

class ForgetPassRepo {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> signUpWithEmailAndPass() async {
    User? user = _firebaseAuth.currentUser; 
    
    if (user != null && !user.emailVerified) {
      try {
        await user.sendEmailVerification();
        print('تم إرسال رابط التحقق إلى ${user.email}');
      } catch (error) {
        print('فشل إرسال رابط التحقق: $error');
        throw('فشل إرسال رابط التحقق: $error');
      }
    } else {
      print('المستخدم غير موجود أو تم التحقق من البريد الإلكتروني بالفعل');
    }
  }
}
