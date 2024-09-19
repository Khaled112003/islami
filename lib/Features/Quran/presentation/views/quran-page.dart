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
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<SurahCubit>(context).fetchSurahs();

    _searchController.addListener(() {
      BlocProvider.of<SurahCubit>(context).filterSurahs(_searchController.text);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SurahCubit, SurahState>(
      listener: (context, state) {
        BlocProvider.of<SurahCubit>(context).filterSurahs(_searchController.text);
        
      },
      child: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
              const    SizedBox(height: 21),
                  SearchItem(searchController: _searchController),
              const    SizedBox(height: 40),
                 const SurahList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
