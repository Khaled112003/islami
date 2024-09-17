import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:islami/core/constant/my_color.dart';

class AppbarItem extends StatelessWidget {
  const AppbarItem({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: IconButton(
            onPressed: () {
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              } else {
                // في حالة عدم وجود صفحات يمكن الرجوع إليها
                context.go('/'); // أو الصفحة التي تريد الرجوع إليها
              }
            },
            icon: const Icon(
              Icons.arrow_circle_left_outlined,
              size: 50,
              color: Mycolors.green,
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Text(
              text,
              style: const TextStyle(
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
