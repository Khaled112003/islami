import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:islami/Features/audios/presentation/manger/audio_cubit.dart';
import 'package:islami/Features/audios/presentation/views/widget/audio_listview.dart';
import 'package:islami/core/constant/my_color.dart';
import 'package:islami/core/widgets/textfiled-item.dart';

class AudioPage extends StatefulWidget {
  const AudioPage({super.key});

  @override
  State<AudioPage> createState() => _AudioPageState();
}

class _AudioPageState extends State<AudioPage> {
  final TextEditingController _searchController = TextEditingController();
  bool isSearchVisible = false;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<AudioCubit>(context).fetchAudioData();

    // إضافة مستمع لحقل البحث
    _searchController.addListener(() {
      print(
          'Current Search Query: ${_searchController.text}'); // هذا السطر للتحقق
      BlocProvider.of<AudioCubit>(context).filterAudio(_searchController.text);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Mycolors.myWhite,
      automaticallyImplyLeading: false,
      title: isSearchVisible
          ? SerchTextFiled(
              searchController: _searchController,
              onchange: (value) =>
                  BlocProvider.of<AudioCubit>(context).filterAudio(value),
            )
          : const Center(
              child: Text(
                'Listen',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Mycolors.green,
                ),
              ),
            ),
      leading: isSearchVisible
          ? IconButton(
              onPressed: () {
                setState(() {
                  isSearchVisible = false;
                });
              },
              icon: const Icon(
                Icons.arrow_back,
                size: 30,
                color: Mycolors.green,
              ),
            )
          : IconButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_circle_left_outlined,
                size: 40,
                color: Mycolors.green,
              ),
            ),
      actions: [
        if (!isSearchVisible)
          IconButton(
            onPressed: () {
              setState(() {
                isSearchVisible = true;
              });
            },
            icon: const Icon(
              Icons.search,
              size: 35,
              color: Mycolors.green,
            ),
          )
      ],
    ),
    body: Column(
      children: [
        Container(
          color: Colors.grey[300],
          height: 1,
        ),
        const SizedBox(height: 20),
        Expanded( // استخدام Expanded هنا لتجنب الشريط الأصفر
          child: const AudioListview(),
        ),
      ],
    ),
  );
}


}
