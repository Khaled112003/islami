import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/Features/home/presentation/views/widgets/prayer_time_img.dart';
import 'package:islami/core/constant/my_color.dart';

class PrayerTime extends StatelessWidget {
  const PrayerTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Mycolors.prayertime,
          boxShadow: [
      BoxShadow(
        color: const Color.fromARGB(255, 189, 186, 186).withOpacity(0.5),
        spreadRadius: 2,
        blurRadius: 7,
        offset: Offset(0, 3), 
      ),
    ],
        ),
       
        width:double.infinity ,
        height: MediaQuery.of(context).size.height*0.57,
        child: Column(mainAxisAlignment: MainAxisAlignment.start
        , children: [
          PrayerTimeImage()
      
          
        ],),
      ),
    );
  }
}