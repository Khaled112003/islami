import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:islami/Features/home/presentation/views/widgets/item_image.dart';
import 'package:islami/core/constant/my_color.dart';

class IslamyActivites extends StatelessWidget {
  const IslamyActivites({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Mycolors.collectionColor,
      ),
      height: MediaQuery.of(context).size.height * 0.10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              GoRouter.of(context).go('/Tasbih');
            },
            child: const ItemImage(
              image: 'assets/images/sbhaa.png',
              text: 'Tasbih',
            ),
          ),
          GestureDetector(
            onTap: () {
              GoRouter.of(context).go('/Accident');
            },
            child: const ItemImage(
              image: 'assets/images/doaa.png',
              text: 'accident',
            ),
          ),
          GestureDetector(
            onTap: () {
              GoRouter.of(context).go('/Doaa');
            },
            child: const ItemImage(
              image: 'assets/images/ahades.png',
              text: 'Doaa',
            ),
          ),
          GestureDetector(
            onTap: () {
              GoRouter.of(context).go('/azkar');
            },
            child: const ItemImage(
              image: 'assets/images/fawanes.png',
              text: 'azkar',
            ),
          ),
          const SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }
}
