import 'package:flutter/material.dart';
import 'package:islami/core/constant/my_color.dart';

class SerchTextFiled extends StatelessWidget {
  const SerchTextFiled({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(height:45 ,
        child: TextField(
          decoration: InputDecoration(fillColor: Mycolors.myWhite,filled: true,
              hintText: 'Search...',
              hintStyle: const TextStyle(
                color: Mycolors.green,
                fontSize: 18
              ),
              prefixIcon: const Icon(
                Icons.search,
                color: Mycolors.green,
                size: 28,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color:Mycolors.myWhite),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Mycolors.myWhite, width: 2), 
              ),
        
              ),
              
        ),
      ),
    );
  }
}