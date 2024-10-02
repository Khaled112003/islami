import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/Features/Quran/presentation/manger/surah/surah_cubit.dart';
import 'package:islami/core/constant/my_color.dart';

class SerchTextFiled extends StatelessWidget {
  const SerchTextFiled({super.key, required this.searchController});
  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
      decoration: InputDecoration(
        fillColor: Mycolors.myWhite,
        filled: true,
        hintText: 'Search...',
        hintStyle: const TextStyle(color: Mycolors.green, fontSize: 18),
        prefixIcon: const Icon(
          Icons.search,
          color: Mycolors.green,
          size: 28,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Mycolors.myWhite),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Mycolors.myWhite, width: 2),
        ),
      ),
      onChanged: (text) {
        BlocProvider.of<SurahCubit>(context).filterSurahs(text);
      },
    );
  }
}
