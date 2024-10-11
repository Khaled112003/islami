import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:islami/core/constant/my_color.dart';
import 'package:islami/core/widgets/auth_textfield.dart';

class EmailAndPass extends StatelessWidget {
  const EmailAndPass({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
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
        ),
        SizedBox(
          height: 25,
        ),
        AuthTextfield(
          obscureText: true,
          hintText: 'Password',
          icon: Icon(
            Icons.password,
            color: Mycolors.green,
            size: 28,
          ),
        ),SizedBox(
                height: 15,
              ),
              
      ],
    );
  }
}
