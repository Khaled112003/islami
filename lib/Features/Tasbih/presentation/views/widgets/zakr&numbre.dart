import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/core/constant/my_color.dart';

class ZakrAndNumber extends StatelessWidget {
  const ZakrAndNumber({super.key, required this.text});
  final String text;
  

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 380,
        height: MediaQuery.of(context).size.height * 0.55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Mycolors.prayertime,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 170,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Mycolors.green,
              ),
              child:  Center(
                child: Text(
                  text,
                  style:const TextStyle(
                      color: Colors.white,
                      fontSize: 100,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          const  SizedBox(
              height: 30,
            ),
          const  Text(
              "الحمد لله",
              style: TextStyle(
                  fontFamily: 'NotoNastaliqUrdu',
                  fontSize: 70,
                  fontWeight: FontWeight.bold ,color:Mycolors.green ),
            )
          ],
        ),
      ),
    );
  }
}
