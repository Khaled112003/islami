import 'package:flutter/material.dart';
import 'package:islami/Features/Quran/data/model/surah_model/surah_model.dart';
import 'package:islami/Features/Quran/presentation/views/widgets/surah-details.dart';

class SurahName extends StatelessWidget {
  const SurahName({super.key, required this.surahModel});
  final SurahModel surahModel;

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            surahModel.englishName!,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
      const  SizedBox(
          height: 10,
        ),
        Row(
          children: [
            SurahDetails(
              text: surahModel.revelationType!,
            ),
           const SizedBox(
              width: 10,
            ),
            SurahDetails(
              text: '${surahModel.ayahs!.last.numberInSurah} ayat',
            )
          ],
        ),
      ],
    );
  }
}
