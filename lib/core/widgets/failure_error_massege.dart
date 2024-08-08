import 'package:flutter/material.dart';

class FailureErrorMessage extends StatelessWidget {
  const FailureErrorMessage({super.key, required this.errormassage});
  final String errormassage;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text( errormassage, textAlign: TextAlign.center ,style:const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),));
  }
}