import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/Features/home/presentation/manger/prayertime/prayer_time_cubit.dart';
import 'package:islami/Features/home/presentation/views/widgets/Adhan_time.dart';
import 'package:islami/core/constant/my_color.dart';
import 'package:islami/core/widgets/failure_error_massege.dart';
import 'package:islami/core/widgets/loading.dart';

import 'prayer_time_img.dart';

class PrayerTime extends StatelessWidget {
  const PrayerTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrayerTimeCubit, PrayerTimeState>(
      builder: (context, state) {
        if (state is PrayerTimesuccsess) {
          var adhanTimes = state.Adhan?.first.items;
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Mycolors.prayertime,
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(255, 189, 186, 186)
                      .withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const PrayerTimeImage(),
                AdhanTime(
                  adhanname: 'الفجر',
                  icon: CupertinoIcons.cloud_moon,
                  adhandate: adhanTimes?.first.fajr ?? "غير متوفر",
                ),
                AdhanTime(
                  adhanname: 'الشروق',
                  icon: CupertinoIcons.cloud_sun,
                  adhandate: adhanTimes?.first.shurooq ?? "غير متوفر",
                ),
                AdhanTime(
                  adhanname: 'الظهر',
                  icon: CupertinoIcons.sun_max,
                  adhandate: adhanTimes?.first.dhuhr ?? "غير متوفر",
                ),
                AdhanTime(
                  adhanname: 'العصر',
                  icon: CupertinoIcons.sunset,
                  adhandate: adhanTimes?.first.asr ?? "غير متوفر",
                ),
                AdhanTime(
                  adhanname: 'المغرب',
                  icon: CupertinoIcons.sun_dust,
                  adhandate: adhanTimes?.first.maghrib ?? "غير متوفر",
                ),
                AdhanTime(
                  adhanname: 'العشاء',
                  icon: CupertinoIcons.moon,
                  adhandate: adhanTimes?.first.isha ?? "غير متوفر",
                ),
                const SizedBox(height: 0),
              ],
            ),
          );
        } else if (state is PrayerTimefailure) {
          return FailureErrorMessage(errormassage: state.errorMassage);
        } else {
          return const LoadingIndicator();
        }
      },
    );
  }
}