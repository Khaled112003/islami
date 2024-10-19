import 'package:flutter/material.dart';
import 'package:islami/Features/authentication/presntations/views/widgets/forget_pass_text.dart';
import 'package:islami/core/constant/my_color.dart';
import 'package:islami/core/widgets/auth_textfield.dart';
import 'package:islami/core/widgets/button_item.dart';

class TextFieldlsLogin extends StatelessWidget {
  const TextFieldlsLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        const AuthTextfield(
          hintText: 'Email',
          icon: Icon(
            Icons.email,
            color: Mycolors.green,
            size: 28,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        const AuthTextfield(
          obscureText: true,
          hintText: 'Password',
          icon: Icon(
            Icons.password,
            color: Mycolors.green,
            size: 28,
          ),
        ),
       const SizedBox(
          height: 15,
        ),
       const ForgetPassText(),
        const SizedBox(
          height: 25,
        ),
        ButtonItem(
          onPressed: () {},
          text: 'Login',
        ),
      ],
    );
  }
}
