
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/onboarding/presentation/manger/OnbordingCubit.dart';
import 'package:islami/onboarding/presentation/views/widgets/body/onbording_body.dart';
import 'package:islami/onboarding/presentation/views/widgets/body/onbordingbuttonswid.dart';

import '../manger/onbordingcontrolstate.dart';

class OnbordingPage extends StatelessWidget {
 const OnbordingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnbordingCubit, OnbordingState>(
      builder: (context, state) {
        OnbordingCubit controler =
            context.read<OnbordingCubit>();
    
        return Scaffold(
          body: Stack(
            fit: StackFit.expand,
            children: [
              
              Column(
                children: [
                  Expanded(
                    child: OnbordingBody(controler: controler),
                  ),
                 
                ],
                
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: OnbordingButton(controler: controler),)
            ],
          ),
        );
      },
    );
  }
}
