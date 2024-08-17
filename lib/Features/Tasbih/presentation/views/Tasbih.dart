import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/Features/Tasbih/presentation/manger/Tasbih_cubit/tasbih_cubit.dart';
import 'package:islami/Features/Tasbih/presentation/views/widgets/adding_number.dart';
import 'package:islami/Features/Tasbih/presentation/views/widgets/tasbih_appbar.dart';
import 'package:islami/Features/Tasbih/presentation/views/widgets/zakr&numbre.dart';

class Tasbih extends StatefulWidget {
  const Tasbih({super.key});

  @override
  State<Tasbih> createState() => _TasbihState();
}

class _TasbihState extends State<Tasbih> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasbihCubit(),
      child: const Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                 TasbihAppbar(),
                 SizedBox(height: 40),
                 ZakrAndNumber(),
                 SizedBox(height: 20),
                AddingNumbers(
                  
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
