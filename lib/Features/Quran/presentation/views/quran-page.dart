import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/Features/Quran/presentation/manger/surah/surah_cubit.dart';
import 'package:islami/Features/Quran/presentation/views/widgets/surah-list.dart';
import 'package:islami/core/constant/my_color.dart';
import 'package:islami/core/widgets/textfiled-item.dart';

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
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 80,
            floating: true,
            pinned: true,
            shape: CircleBorder(
              side: BorderSide.none,
            ),
            backgroundColor: Colors.transparent.withOpacity(0),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    SerchTextFiled(searchController: _searchController ,onchange:(text) =>  BlocProvider.of<SurahCubit>(context).filterSurahs(text),),
                    MyDivider()
                  ],
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: 10),
                SurahList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyDivider extends StatelessWidget {
  const MyDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      endIndent: 5,
      color: Mycolors.green,
      thickness: 1,
    );
  }
}
