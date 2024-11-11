 


import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:islami/onboarding/data/model/bordingmodel.dart';
import 'package:islami/onboarding/presentation/manger/onbordingcontrolstate.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnbordingCubit extends Cubit<OnbordingState> {
  OnbordingCubit() : super(Onbordinginitialstate());
PageController pageController =PageController();


 void next(BuildContext context) async {
    if (pageController.page == data.length - 1) {
      final shared = await SharedPreferences.getInstance();
      await shared.setBool('onbording', true);
    GoRouter.of(context).go("/SignUpPage");
    } else {
      pageController.nextPage(duration: Duration(seconds: 1), curve: Curves.bounceIn);
    }
  }
void skip(BuildContext context)async{
  final shared=await SharedPreferences.getInstance() ;
   await shared.setBool('onbording', true);
   
  GoRouter.of(context).go("/SignUpPage");
}


  List data =[
     
    onbordinmodel(txt: '', txt2: "", image:"assets/images/onboard.png"),
    onbordinmodel(txt: '', txt2: " ", image:"assets/images/doaa.png"),
    onbordinmodel(txt: "Highest\n quality\n and\n cheapest\n price", txt2: " ", image:'assets/images/doaa.png' )
  ];
}
