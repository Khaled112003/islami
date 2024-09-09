import 'package:flutter/material.dart';
import 'package:islami/core/constant/my_color.dart';
import 'package:islami/core/widgets/textfiled-item.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        color: Mycolors.prayertime, 
        
       
      ),
      width: MediaQuery.of(context).size.width * 0.90,
      height: MediaQuery.of(context).size.height * 0.1, 
      child: const Column( mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SerchTextFiled(),
        ],
      ),
    );
  }
}


