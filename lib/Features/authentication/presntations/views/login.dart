import 'package:flutter/material.dart';
import 'package:islami/Features/authentication/presntations/views/widgets/textfiels_login.dart';
import 'package:islami/Features/authentication/presntations/views/widgets/forget_pass_text.dart';
import 'package:islami/Features/authentication/presntations/views/widgets/singnup_in_text.dart';
import 'package:islami/core/constant/my_color.dart';
import 'package:islami/core/widgets/button_item.dart';

import 'widgets/login_face_google.dart';
import 'widgets/welcome_message.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({super.key});

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
                  text1: 'Welcome',
                  text2:
                      ' We pray that what we offer benefits you and makes your use of the app easy and rewarding.',
                ),
              LoginTextFields(),  
                ForgetPassText(),
                SizedBox(
                  height: 40,
                ),
                // // ButtonItem(onTap: () {
                  
                // // },
                //   text: 'Login',
                // ),
                LoginWithFaceOrGoogle(),
                SignUpOrInText(
                  namePage: '/SignUpPage',
                  text1: "Don't have an account? ",
                  text2: "Sign up",
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
