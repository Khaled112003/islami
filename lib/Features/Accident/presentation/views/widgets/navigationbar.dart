import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/Features/Accident/presentation/manger/accident/accident_cubit.dart';
import 'package:islami/Features/Accident/presentation/views/widgets/wid_navigation.dart';

class AccidentNavigitionbar extends StatelessWidget {
  const AccidentNavigitionbar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccidentCubit, AccidentState>(
      builder: (context, state) {
        final accidentCubit = context.read<AccidentCubit>();
        return WidgetNanigationBar(
          firstNum: accidentCubit.currentHadithIndex.toString(),
          nextFun: accidentCubit.getNextHadith,
          previousFun: accidentCubit.getPreviousHadith,
        );
      },
    );
  }
}
