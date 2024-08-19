import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/core/constant/my_color.dart';

import '../../manger/Tasbih_cubit/tasbih_cubit.dart';

class ZakrAndNumber extends StatelessWidget {
  const ZakrAndNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasbihCubit, int>(
      builder: (context, count) {
        final cubit = BlocProvider.of<TasbihCubit>(context); 
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
                  child: Center(
                    child: Text(
                      count.toString(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 100,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  cubit.currentText, 
                  style: const TextStyle(
                      fontFamily: 'NotoNastaliqUrdu',
                      fontSize: 70,
                      fontWeight: FontWeight.bold,
                      color: Mycolors.green),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
