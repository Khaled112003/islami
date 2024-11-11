import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:islami/core/constant/my_color.dart';

class AppbarItem extends StatelessWidget {
  const AppbarItem(
      {super.key, required this.text, required this.onPressed, this.color, this.size});
  final String text;
  final void Function() onPressed;
  final Color? color;
   final double? size;

  @override
  Widget build(BuildContext context) {
    return Container(
      
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0, top: 10),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(onTap:onPressed ,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Image.asset('assets/images/previous.png',height: 35,),
                    ))),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Text(
                  text,
                  style:  TextStyle(
                    fontSize:size?? 40,
                    fontWeight: FontWeight.bold,
                    color: color?? Mycolors.green,
                    fontFamily: 'NotoNastaliqUrdu',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
