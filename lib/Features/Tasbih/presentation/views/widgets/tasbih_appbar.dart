import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:islami/core/constant/my_color.dart';

class TasbihAppbar extends StatelessWidget {
  const TasbihAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: IconButton(
            onPressed: () {
              GoRouter.of(context).go('/');
              
            },
            icon:const Icon(
              Icons.arrow_circle_left_outlined,
              size: 40,
              color: Mycolors.green,
            ),
          ),
        ),
      const  Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding:  EdgeInsets.only(top: 0), // Adjust the padding as needed
            child: Text(
              'Tasbih',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Mycolors.green,
                fontFamily: 'NotoNastaliqUrdu',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
