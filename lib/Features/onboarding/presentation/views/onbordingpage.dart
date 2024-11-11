import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:islami/Features/onboarding/presentation/manger/onbordingcubit.dart';

import 'widgets/body/onbording_body.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnboardingCubit(),
      child: Scaffold(
        body: BlocBuilder<OnboardingCubit, int>(
          builder: (context, state) {
            return Column(
              children: [
                Expanded(child: OnboardingContent(screenIndex: state)),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Visibility(
                        visible: state > 0,
                        child: TextButton(
                          onPressed: () => context.read<OnboardingCubit>().previousPage(),
                          child: Text("رجوع", style: TextStyle(color: Colors.blue)),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          if (state == 2) {
                           GoRouter.of(context).go('/Loginpage');
                          } else {
                            context.read<OnboardingCubit>().nextPage();
                          }
                        },
                        child: Text(state == 2 ? "ابدأ" : "التالي", style: TextStyle(color: Colors.blue)),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

