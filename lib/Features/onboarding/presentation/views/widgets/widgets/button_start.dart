
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:islami/core/constant/manger_style.dart';
import 'package:islami/core/constant/my_color.dart';

class ItemButtonStarted extends StatelessWidget {
  const ItemButtonStarted({
    super.key, 
  });
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 25),
      child: Container(
        height: 52,
        
        width: 300,
        decoration: BoxDecoration(
            color: Mycolors.green,
            borderRadius: BorderRadius.circular(20)),
        child: MaterialButton(
          onPressed: (){
            GoRouter.of(context).go('/Loginpage');
          },
          child: Text(
            "Get Start",
            style:MangerStyle.font600wSize18
          ),
        ),
      ),
    );
  }
}