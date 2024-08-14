import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/Features/home/presentation/manger/prayertime/prayer_time_cubit.dart';

import 'package:islami/Features/home/presentation/views/widgets/custom_appbar.dart';
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
    return Column(
      children: [
        const CustomAppbar(),
        const SizedBox(
          height: 30,
        ),
        PrayerTime(),
      ],
    );
  }
}
