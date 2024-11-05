import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:islami/Features/authentication/presntations/manger/login/login_cubit.dart';
import 'package:islami/Features/authentication/presntations/views/widgets/form_login.dart';


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
            GoRouter.of(context).push('/DashboardPage');
          } else if (state is LoginFailure) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage)),
            );
          }
        },
        child: FormLogin(
          emailController: _emailController,
          passwordController: _passwordController,
          formKey: formKey,
        ));
  }
}

