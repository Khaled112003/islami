import 'package:flutter/material.dart';
import 'package:islami/Features/libarary/presentation/views/widgets/aya.dart';
import 'package:islami/core/constant/my_color.dart';

class Surah extends StatelessWidget {
  const Surah({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        color: const Color.fromARGB(255, 186, 182, 182), 
        
       
      ),
      width: MediaQuery.of(context).size.width * 0.90,
      height: MediaQuery.of(context).size.height * 0.2, 
      child: const  Row( mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          NumberOfSurah(),
           
          
        ],
      ),
    );
  }
}