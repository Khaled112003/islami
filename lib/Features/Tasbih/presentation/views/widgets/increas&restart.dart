import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/core/constant/my_color.dart';

class IncreaseAndRestart extends StatelessWidget {
  const IncreaseAndRestart({
    super.key,
    required this.icon,
  });
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          width: 92,
          height: 92,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Mycolors.green,
          ),
        ),
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color.fromARGB(255, 200, 200, 193).withOpacity(0.5),
          ),
        ),
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color.fromARGB(255, 200, 200, 193).withOpacity(0.5),
          ),
        ),
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color.fromARGB(255, 200, 200, 193).withOpacity(0.7),
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 35,
          ),
        ),
      ],
    );
  }
}
