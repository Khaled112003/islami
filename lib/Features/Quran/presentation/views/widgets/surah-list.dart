import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:islami/Features/Quran/presentation/views/widgets/Number-Surah.dart';
import 'package:islami/Features/Quran/presentation/views/widgets/surah-name.dart';
import 'package:islami/core/constant/my_color.dart';

class SurahList extends StatelessWidget {
  const SurahList({Key? key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 13),
        child: GestureDetector(
          onTap: () {
            GoRouter.of(context).go('/SurahContent');
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              color: Mycolors.myWhite,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            width: MediaQuery.of(context).size.width * 0.90,
            height: MediaQuery.of(context).size.height * 0.15,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                NumberOfSurah(),
                SurahName(),
                Text(
                  'الفاتحة',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
