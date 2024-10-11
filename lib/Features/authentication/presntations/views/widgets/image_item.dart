import 'package:flutter/material.dart';
import 'package:islami/core/constant/my_color.dart';

class ImageItem extends StatelessWidget {
  const ImageItem({
    super.key, required this.image,
  });
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(width: 50,
    height: 50,
   
        decoration: BoxDecoration(color: Mycolors.myWhite ,borderRadius: BorderRadius.circular(70)),
        child: Center(
          child: Image.asset(
            image, fit: BoxFit.contain,
            width: 30 ,
            
          ),
        ));
  }
}