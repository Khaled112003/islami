import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/Features/Accident/presentation/manger/accident/accident_cubit.dart';

import 'package:islami/core/constant/my_color.dart';

class AccidentNavigitionbar extends StatelessWidget {
  const AccidentNavigitionbar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccidentCubit, AccidentState>(
      builder: (context, state) {
         final accidentCubit = context.read<AccidentCubit>();
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: accidentCubit.getNextHadith,
              icon: const Icon(
                Icons.arrow_circle_right_rounded,
                color: Mycolors.green,
                size: 50,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFF4F4F4),
                    elevation: 5,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        bottomLeft: Radius.circular(8),
                      ),
                    ),
                  ),
                  child: Text(
                    '50 ',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFF4F4F4),
                    elevation: 5,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                    ),
                  ),
                  child:  Text(
                    accidentCubit.currentHadithIndex.toString(),
                    style: TextStyle(color: Mycolors.green),
                  ),
                ),
              ],
            ),
            IconButton(
              onPressed: accidentCubit.getPreviousHadith,
              icon: const Icon(
                Icons.arrow_circle_left_rounded,
                color: Mycolors.green,
                size: 50,
              ),
            ),
          ],
        );
      },
    );
  }
}
