import 'package:flutter/material.dart';
import 'package:islami/core/widgets/appbar_item.dart';

class QuranPage extends StatelessWidget {
  const QuranPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
       
        body: Column(
          children: [AppbarItem(text: '')],
          
          
        ),
        
      ),
    );
  }
}