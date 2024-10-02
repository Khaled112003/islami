import 'package:flutter/material.dart';

class NumberOfAya extends StatelessWidget {
  const NumberOfAya({
    super.key,
    required this.number,
  });
  final int number;

  @override
  Widget build(BuildContext context) {
    double imageWidth = number >= 100
        ? MediaQuery.of(context).size.width * 0.12
        : MediaQuery.of(context).size.width * 0.09;
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          'assets/images/Star.png',
          width: imageWidth,
        ),
        Center(
          child: Text(
            number.toString(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
