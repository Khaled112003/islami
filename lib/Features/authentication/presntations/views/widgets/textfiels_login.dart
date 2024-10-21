import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:islami/Features/authentication/presntations/manger/login/login_cubit.dart';
import 'package:islami/Features/authentication/presntations/views/widgets/forget_pass_text.dart';
import 'package:islami/core/constant/my_color.dart';
import 'package:islami/core/widgets/auth_textfield.dart';
import 'package:islami/core/widgets/button_item.dart';

import '../../manger/sing_up/sign_up_cubit.dart';

class TextFieldlsLogin extends StatefulWidget {
  const TextFieldlsLogin({super.key});

  @override
  State<TextFieldlsLogin> createState() => _TextFieldlsLoginState();
}

class _TextFieldlsLoginState extends State<TextFieldlsLogin> {
  GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is LoginSuccess) {
          Navigator.pop(context);
          GoRouter.of(context).push('/VideoPage');
        } else if (state is LoginFailure) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage)),
          );
        }
      },
      child: Form(
        key: formKey,
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            AuthTextfield(
              controller: _emailController,
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
              controller: _passwordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'الرجاء إدخال كلمة المرور';
                }
                if (value.length < 6) {
                  return 'كلمة المرور يجب أن تكون على الأقل 6 أحرف';
                }
                return null;
              },
              obscureText: true,
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
                if (formKey.currentState!.validate()) {
                  context.read<LoginCubit>().fetchLoginData(
                        _emailController.text,
                        _passwordController.text,
                      );
                }
              },
              text: 'Login',
            ),
          ],
        ),
      ),
    );
  }
}
