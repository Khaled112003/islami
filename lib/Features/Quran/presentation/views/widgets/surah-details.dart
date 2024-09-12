import 'package:flutter/material.dart';

class SurahDetails extends StatelessWidget {
  const SurahDetails({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 25,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color.fromARGB(255, 187, 184, 184).withOpacity(0.4)),
      child: Center(
          child: Text(
        text,
        style:const TextStyle(fontWeight: FontWeight.w400),
      )),
    );
  }
}
