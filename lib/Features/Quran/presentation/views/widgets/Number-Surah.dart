import 'package:flutter/material.dart';

class NumberOfSurah extends StatelessWidget {
  const NumberOfSurah({
    super.key,
    required this.number,
  });
  final int number;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          'assets/images/Star.png',
          width: MediaQuery.of(context).size.width * 0.12,
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
