import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
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
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                AppbarItem(
                  text: 'Tasbih',
                  onPressed: () {
                    context.go('/');
                  },
                ),
                const SizedBox(height: 40),
                const ZakrAndNumber(),
                const SizedBox(height: 20),
                const AddingNumbers(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
