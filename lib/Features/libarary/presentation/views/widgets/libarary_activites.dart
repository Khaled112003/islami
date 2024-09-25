import 'package:flutter/material.dart';

import '../../../../../core/constant/my_color.dart';

class ActiviteItems extends StatelessWidget {
  const ActiviteItems({super.key, required this.imags, required this.ontap});
  final String imags;
  final void Function() ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Mycolors.prayertime),
        width: 80,
        height: 80,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            imags,
          ),
        ),
      ),
    );
  }
}