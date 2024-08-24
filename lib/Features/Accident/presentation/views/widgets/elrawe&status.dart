import 'package:flutter/material.dart';
import 'package:islami/core/constant/my_color.dart';

class ElraweAndstatus extends StatelessWidget {
  const ElraweAndstatus({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Mycolors.myWhite.withOpacity(0.3),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 12.0, top: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
               const Text(
                  ' status:  ',
                  style:  TextStyle(
                       fontSize: 16),
                ),Text(
                  '${text}',
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 18),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
