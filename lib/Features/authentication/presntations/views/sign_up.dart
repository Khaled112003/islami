import 'package:flutter/material.dart';
import 'package:islami/Features/authentication/presntations/views/widgets/login_face_google.dart';
import 'package:islami/Features/authentication/presntations/views/widgets/textfields_signup.dart';
import 'package:islami/Features/authentication/presntations/views/widgets/welcome_message.dart';
import 'package:islami/core/constant/my_color.dart';

import 'widgets/singnup_in_text.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Mycolors.authColor,
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: const Column(
              children: [
                WelcomeMessage(
                  text1: 'Create Account',
                  text2:
                      "Sign up now and start exploring all that our app has to offer. We're excited to welcome you to our community!",
                ),
                
               
                SignupTextfield(),
                
                SizedBox(
                  height: 20,
                ),
                
                LoginWithFaceOrGoogle(),
                SignUpOrInText(
                  namePage: '/Loginpage',
                  text1: 'Already have an account yet? ',
                  text2: 'Login',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
