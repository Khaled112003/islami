import 'package:flutter/material.dart';
import 'package:islami/core/constant/my_color.dart';

class libraryItem extends StatelessWidget {
  const libraryItem({
    super.key,
    required this.text,
    required this.image,
    this.textColor = Mycolors.red, 
  });
  final String text, image;
  final Color textColor; 

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Mycolors.deepwhite,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      width: MediaQuery.of(context).size.width * 0.90,
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 24,
                color: textColor), 
          ),
          Image.asset(
            image,
            width: MediaQuery.of(context).size.width * 0.2,
          )
        ],
      ),
    );
  }
}
