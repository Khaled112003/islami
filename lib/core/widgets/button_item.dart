import 'package:flutter/material.dart';
import 'package:islami/core/constant/my_color.dart';

class ButtonItem extends StatelessWidget {
  const ButtonItem({
    super.key, required this.text, required this.onPressed,
  });
  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      
      width: double.infinity,
      decoration: BoxDecoration(
          color: Mycolors.green,
          borderRadius: BorderRadius.circular(20)),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          text,
          style:const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}