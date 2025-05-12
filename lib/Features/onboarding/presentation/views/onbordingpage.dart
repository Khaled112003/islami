
import 'package:flutter/material.dart';
import 'package:islami/Features/onboarding/presentation/views/widgets/widgets/button_start.dart';
import 'package:islami/Features/onboarding/presentation/views/widgets/widgets/doctor_logo_text.dart';
import 'package:islami/core/constant/manger_style.dart';
class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child:  SingleChildScrollView(
            child: Column(
              children: [
              // const  LogoAndText(),
               const DoctorAndlogAndText(),
                Text(
                  'Simplify your religious and organizational life with the Islami app. Easily manage and schedule all your Islamic appointments, from prayer times to religious lectures and Islamic events, for a unique experience.',
                  textAlign: TextAlign.center,style: MangerStyle.font400wSize10,
                ),
                SizedBox(height: 20,),
              const  ItemButtonStarted()
              ],
            ),
          ),
        ),
      ),
    );
  }
}





