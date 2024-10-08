import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:islami/Features/Quran/presentation/manger/surah/surah_cubit.dart';
import 'package:islami/Features/Quran/presentation/views/widgets/Number-Surah.dart';
import 'package:islami/Features/Quran/presentation/views/widgets/surah-name.dart';
import 'package:islami/core/constant/my_color.dart';
import 'package:islami/core/widgets/failure_error_massege.dart';
import 'package:islami/core/widgets/loading.dart';

class SurahList extends StatelessWidget {
  const SurahList({Key? key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SurahCubit, SurahState>(
      builder: (context, state) {
        if (state is SurahSuccess) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: state.filteredSurahs.length,
            itemBuilder: (context, index ) {
              final surah = state.filteredSurahs[index];
              final ayahs = surah.ayahs;
              final numberInSurah = ayahs != null && index < ayahs.length
                  ? ayahs[index].numberInSurah?.toInt() ?? 0
                  : 0;

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 13),
                child: GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push('/SurahContent', extra: surah);
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        NumberOfSurah(number: numberInSurah),
                        SurahName(surahModel: surah),
                        Text(
                          surah.name ?? '',
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        } else if (state is SurahFailure) {
          return FailureErrorMessage(errormassage: state.errorMassage);
        } else {
          return ShimmerLoading(
            width: MediaQuery.of(context).size.width * 0.90,
            height: MediaQuery.of(context).size.height * 0.15,
            itemCount: 10,
            widget: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 13),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    color: const Color.fromARGB(255, 26, 21, 21),
                  ),
                  width: MediaQuery.of(context).size.width * 0.90,
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        color: const Color.fromARGB(255, 5, 3, 3),
                      ),
                      Container(
                        width: 100,
                        height: 20,
                        color: const Color.fromARGB(255, 22, 21, 21),
                      ),
                      Container(
                        width: 60,
                        height: 20,
                        color: Colors.grey[400],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
