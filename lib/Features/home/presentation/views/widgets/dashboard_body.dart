import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/Features/home/presentation/manger/prayertime/prayer_time_cubit.dart';

import 'package:islami/Features/home/presentation/views/widgets/dashboard_activites.dart';
import 'package:islami/Features/home/presentation/views/widgets/prayer_time.dart';

class DashboardBody extends StatefulWidget {
  const DashboardBody({super.key});

  @override
  State<DashboardBody> createState() => _DashboardBodyState();
}

class _DashboardBodyState extends State<DashboardBody> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<PrayerTimeCubit>(context).fetchPrayerData();
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child:   Column(
        children: [

          
          SizedBox(
            height: 30,
          ),
           IslamyActivites(),
           SizedBox(
            height: 10,
          ),
          PrayerTime(),
        ],
      ),
    );
  }
}
