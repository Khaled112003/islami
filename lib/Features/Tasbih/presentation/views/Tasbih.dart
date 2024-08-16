import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/Features/Tasbih/presentation/views/widgets/adding_number.dart';
import 'package:islami/Features/Tasbih/presentation/views/widgets/zakr&numbre.dart';
import 'package:islami/core/constant/my_color.dart';

class Tasbih extends StatelessWidget {
  const Tasbih({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Mycolors.myWhite,
            title: const Center(
                child: Text(
              'Tasbih ',
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Mycolors.green,
                  fontFamily: 'NotoNastaliqUrdu'),
            )),
          ),
          body: const Column(
            children: [
              SizedBox(
                height: 40,
              ),
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
