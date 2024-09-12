import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:islami/Features/Quran/presentation/manger/cubit/ayat_cubit.dart';

import 'package:islami/Features/Quran/presentation/views/widgets/aya-number.dart';
import 'package:islami/core/constant/my_color.dart';
import 'package:islami/core/widgets/failure_error_massege.dart';
import 'package:islami/core/widgets/loading.dart';

class AyaList extends StatelessWidget {
  const AyaList({super.key});

  @override
  @override
Widget build(BuildContext context) {
  return BlocBuilder<AyatCubit, AyatState>(
    builder: (context, state) {
      if (state is AyatSuccsess) {
        final ayahs = state.ayat;

        return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: ayahs.length,
          itemBuilder: (context, index) {
            final ayah = ayahs[index];
           int ayaNumber = (ayah.numberInSurah ?? 0).toInt();

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Mycolors.myWhite,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                width: MediaQuery.of(context).size.width * 0.95,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      NumberOfAya(number: ayaNumber),
                      Flexible(
                        child: Text(
                          ayah.text ?? "",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                          ),
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      } else if (state is AyatFailure) {
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
