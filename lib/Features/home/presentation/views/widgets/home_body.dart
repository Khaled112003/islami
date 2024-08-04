import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/Features/home/presentation/views/widgets/custom_appbar.dart';
import 'package:islami/Features/home/presentation/views/widgets/prayer_time.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      customAppbar(),
      SizedBox(height: 30,),
      PrayerTime(),
      

    ],);
  }
}