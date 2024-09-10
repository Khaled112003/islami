import 'package:flutter/material.dart';

import 'package:islami/Features/Quran/presentation/views/widgets/aya-list.dart';
import 'package:islami/core/widgets/appbar_item.dart';

class SurahContent extends StatelessWidget {
  const SurahContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 230, 222, 222),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  AppbarItem(
                    text: 'الفاتحة',
                    pagename: '/QuranPage',
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  AyaList()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
