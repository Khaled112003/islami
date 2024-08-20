import 'package:flutter/material.dart';
import 'package:islami/core/constant/my_color.dart';

class AccidentNavigitionbar extends StatelessWidget {
  const AccidentNavigitionbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_circle_right_rounded,
              color: Mycolors.green,size: 50,
            )),
             IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_circle_left_rounded,
              color: Mycolors.green,size: 50,
            ))

      ],
    );
  }
}
