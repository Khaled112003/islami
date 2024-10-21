import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:islami/Features/authentication/presntations/manger/sing_up/sign_up_cubit.dart';

import 'form_signup.dart';

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
        child: FormSignUp(
          emailController: _emailController,
          formKey: formKey,
          passwordController: _passwordController,
          userNameController: _userNameController,
        ));
  }
}

