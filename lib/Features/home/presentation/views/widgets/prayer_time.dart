import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/Features/home/presentation/manger/prayertime/prayer_time_cubit.dart';
import 'package:islami/Features/home/presentation/views/widgets/Adhan_time.dart';
import 'package:islami/Features/home/presentation/views/widgets/prayer_time_img.dart';
import 'package:islami/core/constant/my_color.dart';
import 'package:islami/core/widgets/failure_error_massege.dart';
import 'package:islami/core/widgets/loading.dart';

class PrayerTime extends StatelessWidget {
  const PrayerTime({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrayerTimeCubit, PrayerTimeState>(
      builder: (context, state) {
        if (state is PrayerTimesuccsess) {
          var adhanTimes = state.Adhan[0];
          return Column(
            children: [
              Row(
                children: [
                  const Text('date : ',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  Text(adhanTimes.date,
                      textDirection: TextDirection.rtl,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color:Colors.black,
                      )),
                ],
              ),
             const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Mycolors.prayertime,
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 189, 186, 186)
                          .withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset:const Offset(0, 3),
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
                      adhandate: adhanTimes.fajr,
                    ),
                    AdhanTime(
                        adhanname: 'الشروق',
                        icon: CupertinoIcons.cloud_sun,
                        adhandate: adhanTimes.shurooq),
                    AdhanTime(
                      adhanname: 'الظهر',
                      icon: CupertinoIcons.sun_max,
                      adhandate: adhanTimes.dhuhr,
                    ),
                    AdhanTime(
                      adhanname: 'العصر',
                      icon: CupertinoIcons.sunset,
                      adhandate: adhanTimes.asr,
                    ),
                    AdhanTime(
                      adhanname: 'المغرب',
                      icon: CupertinoIcons.sun_dust,
                      adhandate: adhanTimes.maghrib,
                    ),
                    AdhanTime(
                        adhanname: 'العشاء',
                        icon: CupertinoIcons.moon,
                        adhandate: adhanTimes.isha),
                    const SizedBox(height: 0),
                  ],
                ),
              ),
            ],
          );
        } else if (state is PrayerTimefailure) {
          return FailureErrorMessage(errormassage: state.errorMassage);
        } else {
          return ShimmerLoading(
            width: double.infinity,
            itemCount: 1,
            height: MediaQuery.of(context).size.height * 0.60,
            widget: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[300],
              ),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.60,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.2,
                    color: Colors.grey[400], // يمثل مكان الصورة
                  ),
                  ...List.generate(6, (index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 16),
                      height: 20,
                      color:
                          Colors.grey[400], // يمثل مكان كل وقت من أوقات الصلاة
                    );
                  }),
                  const SizedBox(height: 0),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
