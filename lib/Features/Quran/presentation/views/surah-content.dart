import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:islami/Features/Quran/data/model/surah_model/surah_model.dart';
import 'package:islami/Features/Quran/presentation/manger/cubit/ayat_cubit.dart';

import 'package:islami/Features/Quran/presentation/views/widgets/aya-list.dart';
import 'package:islami/core/utilitis/routes.dart';
import 'package:islami/core/widgets/appbar_item.dart';

class SurahContent extends StatefulWidget {
  const SurahContent({super.key, required this.surahModel});
    final SurahModel surahModel
;

  @override
  State<SurahContent> createState() => _SurahContentState();
}

class _SurahContentState extends State<SurahContent> {
  @override
void initState() {
  super.initState();
  


  final surahModel = widget.surahModel;

  BlocProvider.of<AyatCubit>(context).fetchSurahData(surah: surahModel);
}
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 230, 222, 222),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  AppbarItem(
                    text: widget.surahModel.name!,
                       onPressed: () {
                context.pop();
              },
                    
                   
                    
                  ),
                const  SizedBox(
                    height: 15,
                  ),
                 const AyaList()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}