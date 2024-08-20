import 'package:flutter/material.dart';
import 'package:islami/core/constant/my_color.dart';

class ElraweAndstatus extends StatelessWidget {
  const ElraweAndstatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Mycolors.myWhite.withOpacity(0.3),
      ),
      child: const Padding(
        padding: EdgeInsets.only(right: 12.0, top: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'الراوي : عمر بن الخطاب',
              textDirection: TextDirection.rtl,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
