import 'package:flutter/material.dart';
import 'package:islami/core/constant/my_color.dart';

class ItemImage extends StatelessWidget {
  const ItemImage({super.key, required this.image, required this.text});
  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: double.infinity,
        width: MediaQuery.of(context).size.width * 0.19,
        child: Container(
          decoration: BoxDecoration(
              color: Mycolors.myWhite, borderRadius: BorderRadius.circular(12)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                height: MediaQuery.of(context).size.height * 0.04,
                image,
                fit: BoxFit.fill,
              ),
              Text(text)
            ],
          ),
        ),
      ),
    );
  }
}
