import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:islami/Features/authentication/presntations/views/widgets/welcome_message.dart';
import 'package:islami/Features/forget_pass/presentation/views/widgets/textfield_forget.dart';
import 'package:islami/core/constant/my_color.dart';
import 'package:islami/core/widgets/appbar_item.dart';
import 'package:islami/core/widgets/button_item.dart';

import 'widgets/forget_images.dart';

class ForgerPasswordPage extends StatelessWidget {
  const ForgerPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Mycolors.babyblue,
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                AppbarItem(
                    color: Mycolors.babyblue,
                    text: "",
                    onPressed: () {
                      context.pop();
                    }),
                const WelcomeMessage(
                    text1: 'Forgot Password',
                    text2:
                        'At our app, we take the security of your information seriously.'),
                const ForgetPassTextfield(),
               const ForgetPassImage(), 
                ButtonItem(text: 'Reset Password', onPressed: (){})
              ],
            ),
          ),
        ),
      ),
    );
  }
}


