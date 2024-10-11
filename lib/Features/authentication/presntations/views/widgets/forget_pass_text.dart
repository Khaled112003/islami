import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ForgetPassText extends StatelessWidget {
  const ForgetPassText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Align(
        alignment: Alignment.centerRight,
        child: Text(
          "Forget Password?",
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold ,fontSize: 14),
        ));
  }
}
