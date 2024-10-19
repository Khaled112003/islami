import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:islami/Features/authentication/presntations/manger/sing_up/sign_up_cubit.dart';
import 'package:islami/core/constant/my_color.dart';
import 'package:islami/core/widgets/auth_textfield.dart';
import 'package:islami/core/widgets/button_item.dart';

class SignupTextfield extends StatefulWidget {
  const SignupTextfield({super.key});
  @override
  State<SignupTextfield> createState() => _SignupTextfieldState();
}

class _SignupTextfieldState extends State<SignupTextfield> {
  GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
          if (state is SignUpLoading) {
          // Show a loading dialog or indicator while sign up is in progress
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is SignUpSuccsess) {
          Navigator.pop(context); 
          GoRouter.of(context).push('/VideoPage'); 
        } else if (state is SignUpFailure) {
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
            AuthTextfield(
              controller: _userNameController,
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
            ),
            const SizedBox(
              height: 40,
            ),
            ButtonItem(
              onPressed: () {
               if (formKey.currentState!.validate()) {
                  context.read<SignUpCubit>().fetchData(
                    _emailController.text,
                    _passwordController.text,
                    _userNameController.text,
                  );
                }
              },
              text: "Create Account",
            ),
          ],
        ),
      ),
    );
  }
}
