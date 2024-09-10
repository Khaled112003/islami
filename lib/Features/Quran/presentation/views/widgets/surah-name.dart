import 'package:flutter/material.dart';
import 'package:islami/Features/Quran/presentation/views/widgets/surah-details.dart';

class SurahName extends StatelessWidget {
  const SurahName({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Al-Fātiḥah',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            SurahDetails(
              text: 'makke',
            ),
            SizedBox(
              width: 10,
            ),
            SurahDetails(
              text: '${7} ayat',
            )
          ],
        ),
      ],
    );
  }
}
