import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:islami/core/constant/my_color.dart';

class AddingNumbers extends StatelessWidget {
  const AddingNumbers({super.key, required this.onPressed});
   final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 370,
      height: MediaQuery.of(context).size.height * 0.18,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Mycolors.prayertime,
      ),
      child: Center(
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
              width: 92,
              height: 92,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Mycolors.green,
              ),
            ),
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 200, 200, 193).withOpacity(0.5),
              ),
            ),
            Container(
              width: 50,
              height:50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 200, 200, 193).withOpacity(0.5),
              ),
            ),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 200, 200, 193).withOpacity(0.7),
              ),
              child: Icon(CupertinoIcons.add, color: Colors.white ,size: 35,),
            ),
            Positioned(bottom: MediaQuery.of(context).size.height * 0.09,
            left: 180,
              child: IconButton(onPressed: onPressed, icon:Icon(Icons.restart_alt,size: 40,) ))
          ],
        ),
      ),
    );
  }
}
