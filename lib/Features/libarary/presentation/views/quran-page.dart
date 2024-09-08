import 'package:flutter/material.dart';
import 'package:islami/Features/libarary/presentation/views/widgets/search-item.dart';
import 'package:islami/Features/libarary/presentation/views/widgets/surah.dart';
import 'package:islami/core/widgets/appbar_item.dart';

class QuranPage extends StatelessWidget {
  const QuranPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
       
        body: Column(
          children: [
            AppbarItem(text: ''),
            
            SearchItem(),
            Surah()
          ],
          
          
        ),
        
      ),
    );
  }
}