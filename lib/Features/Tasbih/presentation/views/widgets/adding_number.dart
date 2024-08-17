import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/Features/Tasbih/presentation/manger/Tasbih_cubit/tasbih_cubit.dart';
import 'package:islami/Features/Tasbih/presentation/views/widgets/increas&restart.dart';
import 'package:islami/core/constant/my_color.dart';

class AddingNumbers extends StatelessWidget {
  const AddingNumbers({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 370,
      height: MediaQuery.of(context).size.height * 0.18,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Mycolors.prayertime,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              BlocProvider.of<TasbihCubit>(context).AddingNumbers();
            },
            child:const IncreaseAndRestart(icon: CupertinoIcons.add,),
          ),
          GestureDetector(
            onTap: () {
              BlocProvider.of<TasbihCubit>(context).restart();
            },
            child: const IncreaseAndRestart(icon: CupertinoIcons.refresh,),
          ),
        ],
      ),
    );
  }
}


