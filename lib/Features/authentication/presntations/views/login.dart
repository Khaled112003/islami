import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:islami/core/constant/my_color.dart';
import 'package:islami/core/widgets/auth_textfield.dart';

import 'widgets/welcome_message.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Mycolors.authColor,
      body: Column(
        children: [
          SizedBox(
            height: 70,
          ),
          WelcomeMessage(),
          SizedBox(
            height: 50,
          ),
          AuthTextfield(
            hintText: 'Email',
            icon: Icon(
              Icons.email,
              color: Mycolors.green,
              size: 28,
            ),
          ),SizedBox(
            height: 25,
          ),
          AuthTextfield(obscureText: true,
            hintText: 'Password',
            icon: Icon(
              Icons.password,
              color: Mycolors.green,
              size: 28,
            ),
          )
        ],
      ),
    );
  }
}
