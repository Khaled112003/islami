import 'package:flutter/material.dart';
import 'package:islami/Features/home/presentation/views/widgets/item_image.dart';
import 'package:islami/core/constant/my_color.dart';

class customAppbar extends StatelessWidget {
  const customAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10)
      , color:Mycolors.collectionColor ,
    )
      ,
    height: MediaQuery.of(context).size.height*0.10, child: 
   const Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      
      ItemImage(image: 'assets/images/sbhaa.png', text: 'Tasbih',),
      
      ItemImage(image: 'assets/images/doaa.png' ,text: 'accident',),
      
      ItemImage(image: 'assets/images/ahades.png' , text: 'Doaa',),
      
    ],),);
  }
}