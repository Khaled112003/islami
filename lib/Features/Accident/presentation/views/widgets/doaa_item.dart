import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/Features/Accident/presentation/manger/doaa/doaa_cubit.dart';
import 'package:islami/Features/Accident/presentation/manger/doaa/doaa_state.dart';
import 'package:islami/core/constant/my_color.dart';
import 'package:islami/core/widgets/failure_error_massege.dart';
import 'package:islami/core/widgets/loading.dart';

class DoaaItem extends StatelessWidget {
  const DoaaItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoaaCubit, DoaaState>(
      builder: (context, state) {
        if (state is DoaaSuccess) {
          if (state.doaaList.isNotEmpty &&
              state.currentHadithIndex > 0 &&
              state.currentHadithIndex <= state.doaaList.length) {
            final currentDoaa = state.doaaList[state.currentHadithIndex - 1];

            print('Current Doaa Content: ${currentDoaa.content}');

            return Container(
              width: 380,
              height: MediaQuery.of(context).size.height * 0.65,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Mycolors.prayertime,
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 8, top: 30, right: 8, bottom: 25),
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          currentDoaa.content,
                          textDirection: TextDirection.rtl,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Center(child: Text('لا توجد بيانات لعرضها.'));
          }
        } else if (state is DoaaFailure) {
          print(state.errorMessage);
          return FailureErrorMessage(errormassage: state.errorMessage);
        } else {
          return const ShimmerLoading();
        }
      },
    );
  }
}
