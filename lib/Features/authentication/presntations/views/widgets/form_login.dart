import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/core/constant/my_color.dart';
import 'package:islami/core/widgets/auth_textfield.dart';

import '../../../../../core/widgets/button_item.dart';
import '../../manger/login/login_cubit.dart';
import 'forget_pass_text.dart';

// ignore: must_be_immutable
class FormLogin extends StatefulWidget {
  FormLogin(
      {super.key,
      required this.emailController,
      required this.passwordController,
      required this.formKey});
  GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          AuthTextfield(
            controller: widget.emailController,
            validator: (data) {
              if (data!.isEmpty) {
                return "Field is required";
              }
              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(data)) {
                return 'Please enter a valid email address';
              }
              return null;
            },
            hintText: 'Email',
            icon: const Icon(
              Icons.email,
              color: Mycolors.green,
              size: 28,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          AuthTextfield(
            suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                icon: Icon(
                  _obscureText ? CupertinoIcons.eye : CupertinoIcons.eye_slash,size: 25,
                  color: Mycolors.green,
                )),
            controller: widget.passwordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'الرجاء إدخال كلمة المرور';
              }
              if (value.length < 6) {
                return 'كلمة المرور يجب أن تكون على الأقل 6 أحرف';
              }
              return null;
            },
            obscureText: _obscureText,
            hintText: 'Password',
            icon: const Icon(
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
            onPressed: () {
              if (widget.formKey.currentState!.validate()) {
                context.read<LoginCubit>().fetchLoginData(
                      widget.emailController.text,
                      widget.passwordController.text,
                    );
              }
            },
            text: 'Login',
          ),
        ],
      ),
    );
  }
}
