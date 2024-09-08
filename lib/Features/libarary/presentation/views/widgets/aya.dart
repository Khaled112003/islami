import 'package:flutter/material.dart';

class NumberOfSurah extends StatelessWidget {
  const NumberOfSurah({super.key});

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
            '1', 
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
