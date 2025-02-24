import 'package:flutter/material.dart';

import 'package:islami/core/constant/manger_style.dart';

class LogoAndText extends StatelessWidget {
  const LogoAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/images/doaa.png",width: 50,height: 30,),
        SizedBox(
          width: 1,
        ),
        Text(
          'Yaqen',
          style: MangerStyle.font700wSize24,
        )
      ],
    );
  }
}