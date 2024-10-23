import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:islami/core/widgets/auth_textfield.dart';

class ForgetPassTextfield extends StatelessWidget {
  const ForgetPassTextfield({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 40,),
        AuthTextfield(hintText: 'Email', icon: Icon(Icons.email)),
      ],
    );
  }
}
