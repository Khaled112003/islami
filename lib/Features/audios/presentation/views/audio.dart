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
  TextEditingController controller = TextEditingController();
  bool isSearchVisible = false; // للتحكم في عرض حقل البحث

  @override
  void initState() {
    BlocProvider.of<AudioCubit>(context).fetchAudioData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Mycolors.myWhite,
        automaticallyImplyLeading: false,
        title: isSearchVisible 
            ? SerchTextFiled(searchController:controller ,onchange: (value) => Text,)  // عرض الـ TextField عند الضغط على البحث
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
                    isSearchVisible = false; // إغلاق البحث والعودة إلى الـ AppBar الأصلي
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
          if (!isSearchVisible) // عرض زر البحث فقط عند عدم عرض الـ TextField
            IconButton(
              onPressed: () {
                setState(() {
                  isSearchVisible = true; // عرض الـ TextField عند الضغط
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
        children:  [
           Container(
            color: Colors.grey[300], // لون الخط
            height: 1, // سمك الخط
          ),
        const  SizedBox(height: 20),
         const AudioListview(),
        ],
      ),
    );
  }}