import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:islami/Features/Quran/presentation/views/quran-page.dart';
import 'package:islami/Features/home/presentation/manger/dashboard/dashboardbody_cubit.dart';
import 'package:islami/Features/libarary/presentation/views/widgets/Libarary_Rectangel.dart';
import 'package:islami/Features/libarary/presentation/views/widgets/libarary_activites.dart';


class LibararyPage extends StatelessWidget {
  const LibararyPage({super.key});

  @override
  Widget build(BuildContext context) {
   
    final List<String> images = [
      'assets/images/sbhaa.png',
      'assets/images/quran.png',
      'assets/images/doaa.png',
      'assets/images/ahades.png',
      'assets/images/video.png',
      'assets/images/sound.png',
    ];

    final Map<int, void Function()> onTapActions = {
      0: () => GoRouter.of(context).go('/Tasbih'),
      1: () => context.read<DashboardCubit>().changePage(1),
      2: () => GoRouter.of(context).go('/Doaa'),
      3: () => GoRouter.of(context).go('/Accident'),
      4: () => GoRouter.of(context).push('/VideoPage'),
      5: () =>GoRouter.of(context).go('/Doaa'),
    };

    return SafeArea(
      child: Column(
        children: [
          const LibararyRectangel(),
          const SizedBox(height: 20),
          const MyDivider(),
          const SizedBox(height: 20),
          Expanded(
            child: Wrap(
              spacing: 15,
              runSpacing: 20,
              children: images.asMap().entries.map((entry) {
                int index = entry.key;
                String image = entry.value;
            
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ActiviteItems(
                  
                    imags: image,
                   
                    ontap: onTapActions[index] ?? () {}, 
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}


