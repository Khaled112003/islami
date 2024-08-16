import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/Features/Tasbih/presentation/views/widgets/adding_number.dart';
import 'package:islami/Features/Tasbih/presentation/views/widgets/zakr&numbre.dart';

import 'widgets/tasbih_appbar.dart';


class Tasbih extends StatelessWidget {
  const Tasbih({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 15),
        child: Scaffold(
         
          body:  Column(
            children: [
              TasbihAppbar(),
              SizedBox(height: 40,),
              
              ZakrAndNumber(),
              SizedBox(
                height: 20,
              ),
              AddingNumbers()
            ],
          ),
        ),
      ),
    );
  }
}
