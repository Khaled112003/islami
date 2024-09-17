import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/Features/Quran/presentation/manger/surah/surah_cubit.dart';
import 'package:islami/Features/Quran/presentation/views/widgets/surah-list.dart';

import 'package:islami/Features/Quran/presentation/views/widgets/search-item.dart';



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
      child: 
         CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                 
                  SizedBox(
                    height: 21,
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
      );
   
  }
}