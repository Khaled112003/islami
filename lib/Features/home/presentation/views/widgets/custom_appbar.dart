import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:islami/Features/home/presentation/views/widgets/item_image.dart';
import 'package:islami/core/constant/my_color.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Mycolors.collectionColor,
      ),
      height: MediaQuery.of(context).size.height * 0.10,
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector( onTap:  () {
            GoRouter.of(context).go('/Tasbih');
            
          }, 
            child:const ItemImage(
              image: 'assets/images/sbhaa.png',
              text: 'Tasbih',
            ),
          ),
       const   ItemImage(
            image: 'assets/images/doaa.png',
            text: 'accident',
          ),
        const  ItemImage(
            image: 'assets/images/ahades.png',
            text: 'Doaa',
          ),
       const   SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }
}
