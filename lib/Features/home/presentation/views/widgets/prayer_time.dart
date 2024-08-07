import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/Features/home/presentation/views/widgets/Adhan_time.dart';
import 'package:islami/Features/home/presentation/views/widgets/prayer_time_img.dart';
import 'package:islami/core/constant/my_color.dart';

class PrayerTime extends StatelessWidget {
  const PrayerTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sample list of prayer times data
    final List<Map<String, dynamic>> prayerTimes = [
      {'name': 'Fajr', 'icon': CupertinoIcons.cloud_moon, 'time': "03:53 AM"},
      {'name': 'Sunrise', 'icon': CupertinoIcons.cloud_sun, 'time': "05:30 AM"},
      {'name': 'Dhuhr', 'icon': CupertinoIcons.sun_max, 'time': "12:00 PM"},
      {'name': 'Asr', 'icon': CupertinoIcons.sunset, 'time': "03:53 PM"},
      {'name': 'Maghrib', 'icon': CupertinoIcons.sun_dust, 'time': "06:53 PM"},
      {'name': 'Isha', 'icon': CupertinoIcons.moon, 'time': "07:50 PM"},
    ];

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Mycolors.prayertime,
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 189, 186, 186).withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.60,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const PrayerTimeImage(),
            Expanded(
              child: ListView.builder(
                itemCount: prayerTimes.length,
                itemBuilder: (context, index) {
                  final prayer = prayerTimes[index];
                  return AdhanTime(
                    adhanname: prayer['name'],
                    icon: prayer['icon'],
                    adhandate: prayer['time'],
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
