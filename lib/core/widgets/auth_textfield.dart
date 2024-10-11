import 'package:flutter/material.dart';
import 'package:islami/core/constant/my_color.dart';

class AuthTextfield extends StatelessWidget {
  const AuthTextfield({super.key, required this.hintText, required this.icon,  this.obscureText});
  final String hintText;
  final Icon icon;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return  TextFormField(obscureText: obscureText?? false,
        decoration: InputDecoration(
            fillColor: const Color.fromARGB(255, 255, 255, 255),
            filled: true,
            hintText: hintText,
            hintStyle: const TextStyle(color: Mycolors.green, fontSize: 15, fontWeight: FontWeight.w300),
            prefixIcon:  icon,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Mycolors.myWhite),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Mycolors.myWhite, width: 2),
            ),
          ),
      
      )
    ;
  }
}