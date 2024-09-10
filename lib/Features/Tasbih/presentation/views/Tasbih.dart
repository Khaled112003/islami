import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/Features/Tasbih/presentation/manger/Tasbih_cubit/tasbih_cubit.dart';
import 'package:islami/Features/Tasbih/presentation/views/widgets/adding_number.dart';

import 'package:islami/Features/Tasbih/presentation/views/widgets/zakr&numbre.dart';
import 'package:islami/core/widgets/appbar_item.dart';

class Tasbih extends StatelessWidget {
  const Tasbih({super.key});

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
                AppbarItem(
                  text: 'Tasbih',
                  pagename: '/',
                ),
                SizedBox(height: 40),
                ZakrAndNumber(),
                SizedBox(height: 20),
                AddingNumbers(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
