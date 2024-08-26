import 'package:flutter/material.dart';
import 'package:islami/core/constant/my_color.dart';

class DoaaItem extends StatelessWidget {
  const DoaaItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
            width: 380,
            height: MediaQuery.of(context).size.height * 0.65,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Mycolors.prayertime,
            ),
            child:const Padding(
              padding:   EdgeInsets.only(left: 8, top: 30, right: 8, bottom: 25),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding:  EdgeInsets.all(8.0),
                      child: Text(
                       "اللهم ارزقني واغفر لابي وامي واكرمنا بزياره بيتك الحرام",
                        textDirection: TextDirection.rtl,
                        style:  TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  
                ],
              ),
            ),
          );;
  }
}