import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/Features/Quran/presentation/manger/surah/surah_cubit.dart';
import 'package:islami/Features/Quran/presentation/views/widgets/surah-list.dart';

import 'package:islami/Features/Quran/presentation/views/widgets/search-item.dart';

import 'package:islami/core/widgets/appbar_item.dart';

class QuranPage extends StatefulWidget {
  const QuranPage({Key? key});

  @override
  State<QuranPage> createState() => _QuranPageState();
  
}

class _QuranPageState extends State<QuranPage> {
  @override
  void initState() {
    BlocProvider.of<SurahCubit>(context).fetchSurahs();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  AppbarItem(
                    text: '',
                    pagename: '/LibararyPage',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SearchItem(),
                  SizedBox(
                    height: 40,
                  ),
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
