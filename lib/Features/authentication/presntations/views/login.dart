import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:islami/Features/authentication/presntations/views/widgets/email_and_pass.dart';
import 'package:islami/Features/authentication/presntations/views/widgets/forget_pass_text.dart';
import 'package:islami/core/constant/my_color.dart';

import 'widgets/welcome_message.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Mycolors.authColor,
      body: Center(
        child:  SizedBox(
          width: MediaQuery.of(context).size.width*0.9,
          child:  const Column(
            children: [
              SizedBox(
                height: 70,
              ),
              WelcomeMessage(),
              SizedBox(
                height: 50,
              ),
             EmailAndPass(),
              SizedBox(
                height: 15,
              ),
             ForgetPassText()
            ],
          ),
        ),
      ),
    );
  }
}

