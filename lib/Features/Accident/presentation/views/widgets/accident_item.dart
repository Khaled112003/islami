import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/Features/Accident/presentation/manger/accident/accident_cubit.dart';
import 'package:islami/Features/Accident/presentation/views/widgets/elrawe&status.dart';
import 'package:islami/core/constant/my_color.dart';
import 'package:islami/core/widgets/failure_error_massege.dart';
import 'package:islami/core/widgets/loading.dart';

class AccidentItem extends StatelessWidget {
  const AccidentItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccidentCubit, AccidentState>(
      builder: (context, state) {
        if (state is AccidentSuccess) {
          final currentHadith = state.hadith[state.currentHadithIndex];

          return Container(
            width: 380,
            height: MediaQuery.of(context).size.height * 0.65,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Mycolors.prayertime,
            ),
            child: Padding(
              padding:  const EdgeInsets.only(left: 8, top: 30, right: 8, bottom: 25),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        currentHadith.hadithArabic ?? '',
                        textDirection: TextDirection.rtl,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    color: Mycolors.prayertime,
                    child: ElraweAndstatus(
                      text: currentHadith.status ?? '',
                    ),
                  ),
                ],
              ),
            ),
          );
        } else if (state is AccidentFailure) {
          return FailureErrorMessage(errormassage: state.errorMassage);
        } else {
          return const LoadingIndicator();
        }
      },
    );
  }
}
