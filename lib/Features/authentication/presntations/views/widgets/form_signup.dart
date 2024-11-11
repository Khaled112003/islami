import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/Features/authentication/presntations/manger/sing_up/sign_up_cubit.dart';
import 'package:islami/core/constant/my_color.dart';
import 'package:islami/core/widgets/auth_textfield.dart';
import 'package:islami/core/widgets/button_item.dart';

class FormSignUp extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController userNameController;
  final GlobalKey<FormState> formKey;

  const FormSignUp({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.userNameController,
    required this.formKey,
  });

  @override
  _FormSignUpState createState() => _FormSignUpState();
}

class _FormSignUpState extends State<FormSignUp> {
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
            controller: widget.userNameController,
            validator: (data) {
              if (data!.isEmpty) {
                return "Field is required";
              }
              return null;
            },
            hintText: 'User Name',
            icon: const Icon(
              Icons.person,
              color: Mycolors.green,
              size: 28,
            ),
          ),const SizedBox(
            height: 15,
          ),
          AuthTextfield(
            controller: widget.emailController,
            validator: (data) {
              if (data!.isEmpty) {
                return "Field is required";
              }
              if (!data.contains('@gmail.com')) {
                return 'Email must contain @gmail.com';
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
            suffixIcon: IconButton(
              icon: Icon(
                _obscureText ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
                size: 25,
                color: Mycolors.green,
              ),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText; 
                });
              },
            ),
            obscureText: _obscureText, 
            hintText: 'Password',
            icon: const Icon(
              Icons.password,
              color: Mycolors.green,
              size: 28,
            ),
          ),
          
          const SizedBox(
            height: 40,
          ),
          ButtonItem(
            onPressed: () {
              if (widget.formKey.currentState!.validate()) {
                context.read<SignUpCubit>().fetchData(
                      widget.emailController.text,
                      widget.passwordController.text,
                      widget.userNameController.text,
                    );
              }
            },
            text: "Create Account",
          ),
        ],
      ),
    );
  }
}
