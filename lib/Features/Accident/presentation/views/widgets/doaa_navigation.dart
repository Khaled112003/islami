import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/Features/Accident/presentation/manger/doaa/doaa_cubit.dart';
import 'package:islami/Features/Accident/presentation/manger/doaa/doaa_state.dart';
import 'package:islami/Features/Accident/presentation/views/widgets/wid_navigation.dart';

class DoaaNavigitionbar extends StatelessWidget {
  const DoaaNavigitionbar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoaaCubit, DoaaState>(
      builder: (context, state) {
        final doaaCubit = context.read<DoaaCubit>();
        return WidgetNanigationBar(
          firstNum: doaaCubit.currentDoaaIndex.toString(),
          nextFun: doaaCubit.getNextDoaa,
          previousFun: doaaCubit.getPreviousDoaa,
        );
      },
    );
  }
}
