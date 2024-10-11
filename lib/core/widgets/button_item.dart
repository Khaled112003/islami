import 'package:flutter/material.dart';
import 'package:islami/core/constant/my_color.dart';

class ButtonItem extends StatelessWidget {
  const ButtonItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Mycolors.green,
          borderRadius: BorderRadius.circular(20)),
      child: MaterialButton(
        onPressed: () {},
        child:const Text(
          'Login',
          style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}