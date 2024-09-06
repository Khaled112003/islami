import 'package:flutter/material.dart';

class ItemImageForLibrary extends StatelessWidget {
  const ItemImageForLibrary({
    super.key, required this.image,
  });
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.height * 0.44,
      child: Image.asset(image),
    );
  }
}