import 'package:flutter/material.dart';
import 'package:islami/Features/authentication/presntations/views/widgets/email_and_pass.dart';
import 'package:islami/Features/authentication/presntations/views/widgets/login_face_google.dart';
import 'package:islami/Features/authentication/presntations/views/widgets/welcome_message.dart';
import 'package:islami/core/constant/my_color.dart';
import 'package:islami/core/widgets/auth_textfield.dart';
import 'package:islami/core/widgets/button_item.dart';

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
                AuthTextfield(
                  hintText: 'User Name',
                  icon: Icon(
                    Icons.email,
                    color: Mycolors.green,
                    size: 28,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                EmailAndPass(),
                SizedBox(
                  height: 40,
                ),
                ButtonItem(
                  text: "Create Account",
                ),
                LoginWithFaceOrGoogle(),
                SignUpOrInText(
                  namePage: '/',
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
