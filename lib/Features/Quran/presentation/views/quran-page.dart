import 'package:flutter/material.dart';
import 'package:islami/Features/Quran/presentation/views/widgets/surah-list.dart';

import 'package:islami/Features/Quran/presentation/views/widgets/search-item.dart';

import 'package:islami/core/widgets/appbar_item.dart';

class QuranPage extends StatelessWidget {
  const QuranPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  AppbarItem(text: ''),
                  SizedBox(height: 20,),
                  SearchItem(),
                  SizedBox(height: 40,),
                  SurahList(),
                ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
