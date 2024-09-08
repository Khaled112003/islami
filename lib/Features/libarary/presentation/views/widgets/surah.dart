import 'package:flutter/material.dart';
import 'package:islami/Features/libarary/presentation/views/widgets/aya.dart';
import 'package:islami/Features/libarary/presentation/views/widgets/surah-name.dart';
import 'package:islami/core/constant/my_color.dart';

class Surah extends StatelessWidget {
  const Surah({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true, // يساعد في ضبط حجم الـ ListView
      itemCount: 8, // مثال على عدد العناصر، عدلها حسب الحاجة
      itemBuilder: (context, index) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          color: Mycolors.myWhite,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20), // إضافة هوامش لتعطي مساحة للعناصر
        width: MediaQuery.of(context).size.width * 0.90,
        height: MediaQuery.of(context).size.height * 0.2,
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
    );
  }
}
