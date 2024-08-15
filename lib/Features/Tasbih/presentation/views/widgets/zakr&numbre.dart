import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/core/constant/my_color.dart';

class ZakrAndNumber extends StatelessWidget {
  const ZakrAndNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Mycolors.prayertime,
       
        
      ),
      child:  Padding(
        padding: const EdgeInsets.only(top:20 ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           Container(
              width: 200,
              height: 170,
              decoration:const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 59, 111, 104),
              ),
              child:const Center(
                child: Text(
                  '1',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 100,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            )
        
          ],
        ),
      ),
    );
  }
}
