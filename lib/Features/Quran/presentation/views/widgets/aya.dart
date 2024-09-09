import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:islami/Features/Quran/presentation/views/widgets/aya-number.dart';
import 'package:islami/core/constant/my_color.dart';

class Aya extends StatelessWidget {
  const Aya({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        color: Mycolors.myWhite,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      width: MediaQuery.of(context).size.width * 0.95,
      
      child:const Padding(
        padding:  EdgeInsets.all(8.0),
        child:  Row( mainAxisAlignment: MainAxisAlignment.end,
          children: [
            
            NumberOfAya(),
            // 
              
            
            Flexible(
              child: Text(
                ' بسم الله الرحمن الرحيم'    ,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                textDirection: TextDirection.rtl,
              ),
            ),
          ],
        ),
      ),
    );
  }
}