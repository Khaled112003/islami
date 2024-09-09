import 'package:flutter/material.dart';

class NumberOfAya extends StatelessWidget {
  const NumberOfAya({super.key, });
  
  

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center, 
      children: [
        Image.asset(
          'assets/images/Star.png',
          width: MediaQuery.of(context).size.width * 0.08,
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
