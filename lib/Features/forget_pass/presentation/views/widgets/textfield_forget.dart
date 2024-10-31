import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/Features/forget_pass/presentation/manger/email_verfiy/email_verification_cubit.dart';
import 'package:islami/core/widgets/auth_textfield.dart';
import 'package:islami/core/widgets/button_item.dart';

import 'forget_images.dart';

class ForgetPassTextfield extends StatefulWidget {
  const ForgetPassTextfield({
    super.key,
  });

  @override
  State<ForgetPassTextfield> createState() => _ForgetPassTextfieldState();
}

class _ForgetPassTextfieldState extends State<ForgetPassTextfield> {
  final TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocListener<EmailVerificationCubit, EmailVerificationState>(
      listener: (context, state) {
        if (state is EmailVerificationLoading) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Sending reset link...')),
      );
    } else if (state is EmailVerificationSuccsess) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Reset link sent successfully.')),
      );
    } else if (state is EmailVerificationFailure) {
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
              height: 40,
            ),
            AuthTextfield(
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
              icon: const Icon(Icons.email),
              controller: emailController,
            ),
            const ForgetPassImage(),
            ButtonItem(
                text: 'Reset Password',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    context
                        .read<EmailVerificationCubit>()
                        .sendEmailVerification(
                          emailController.text.trim(),
                        );
                  }
                })
          ],
        ),
      ),
    );
  }
}
