import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/Features/onboarding/presentation/manger/onbordingcubit.dart';
import 'package:islami/core/constant/my_color.dart';
import 'package:islami/core/widgets/button_item.dart';

import '../../../manger/onbordingcontrolstate.dart';

class OnbordingBody extends StatelessWidget {
  OnbordingBody({
    required this.controler,
    super.key,
  });
  final OnbordingCubit controler;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OnbordingCubit>.value(
      value: controler,
      child: BlocBuilder<OnbordingCubit, OnbordingState>(
        builder: (context, state) {
          return PageView(
            controller: controler.pageController,
            children: List.generate(controler.data.length, (index) {
              return Container(
                color: const Color.fromARGB(255, 244, 243, 241),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: MediaQuery.sizeOf(context).height * 0.5,
                      width: double.infinity,
                      child: Image.asset(
                        controler.data[index].image,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 220),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: const Color.fromARGB(255, 255, 255, 255),
                              ),
                              width: MediaQuery.sizeOf(context).width * 0.8,
                              child: Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 30, vertical: 35),
                                child:  Column(
                                  children: [
                                    const Text(
                                      "Welcome To Athr",
                                      style:  TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold,
                                        color:Mycolors.green,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                   const SizedBox(height: 30,),
                                    const Text(
                                      "Discover the essentials of your faith in one place. Find valuable Islamic content that strengthens your belief and deepens your understanding.",
                                      style:  TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color:Color.fromARGB(255, 61, 62, 62),
                                      ),
                                      textAlign: TextAlign.center,
                                      
                                    ),
                                    const SizedBox(height: 40,),
                                    ButtonItem(text: "Next", onPressed: (){})
                                    
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
