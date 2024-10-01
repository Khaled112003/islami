import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:islami/core/constant/my_color.dart';

class AppbarItem extends StatelessWidget {
  const AppbarItem({super.key, required this.text, required this.onPressed});
  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(  color: const Color.fromARGB(255, 253, 250, 250),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0, top: 10),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed:onPressed
                   
                  
                ,
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
        ),
      ),
    );
  }
}
