import 'package:flutter/cupertino.dart';

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
            color: Color(0xff74080C),
            fontSize: 24,
            fontWeight: FontWeight.w500),
      )
    ]);
  }
}
