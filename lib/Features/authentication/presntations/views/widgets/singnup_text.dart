import 'package:flutter/material.dart';

class SignUpText extends StatelessWidget {
  const SignUpText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(mainAxisAlignment: MainAxisAlignment.center,
      children: [SizedBox(
      height:80,
    ),
        Text(
          "Don't have an account? ",
          style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14),
        ),
        Text("Sign up",style: TextStyle(fontWeight: FontWeight.w600 ,color: Colors.red,fontSize: 15),)
      ],
    );
  }
}
