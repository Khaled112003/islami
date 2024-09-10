import 'package:flutter/material.dart';

import 'package:islami/Features/Quran/presentation/views/widgets/aya-number.dart';
import 'package:islami/core/constant/my_color.dart';

class AyaList extends StatelessWidget {
  const AyaList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 40,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Mycolors.myWhite,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            width: MediaQuery.of(context).size.width * 0.95,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  NumberOfAya(),
                  //

                  Flexible(
                    child: Text(
                      'بسم الله الرحمن الرحيم',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
