import 'package:flutter/cupertino.dart';
import 'package:islami/core/constant/my_color.dart';

class PrayerTimeImage extends StatelessWidget {
  const PrayerTimeImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Image.asset(
        'assets/images/prayertime.png',
        width: double.infinity,
      ),
      const SizedBox(
        height: 10,
      ),
      const Text(
        'Prayer Time',
        style: TextStyle(
            color: Mycolors.green,
            fontSize: 24,
            fontWeight: FontWeight.w500),
      )
    ]);
  }
}
