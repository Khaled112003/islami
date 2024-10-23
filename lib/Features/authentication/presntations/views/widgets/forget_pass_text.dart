import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class ForgetPassText extends StatelessWidget {
  const ForgetPassText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector( onTap: () {
      GoRouter.of(context).push("/ForgerPasswordPage");
    },
      child: const Align(
          alignment: Alignment.centerRight,
          child: Text(
            "Forget Password?",
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold ,fontSize: 14),
          )),
    );
  }
}
