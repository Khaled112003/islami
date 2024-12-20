import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:islami/Features/Accident/presentation/manger/accident/accident_cubit.dart';
import 'package:islami/Features/Accident/presentation/views/widgets/accident_item.dart';
import 'package:islami/core/widgets/appbar_item.dart';

import 'widgets/accident_navigationbar.dart';

class Accident extends StatefulWidget {
  const Accident({super.key});

  @override
  State<Accident> createState() => _AccidentState();
}

class _AccidentState extends State<Accident> {
  void initState() {
    super.initState();

    BlocProvider.of<AccidentCubit>(context).fetchHadithData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            AppbarItem(
              text: 'Accident',
              onPressed: () {
                context.go('/');
              },
            ),
            const SizedBox(height: 40),
            const AccidentItem(),
            const SizedBox(height: 30),
            const AccidentNavigitionbar()
          ],
        ),
      ),
    );
  }
}
