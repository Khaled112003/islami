import 'package:flutter/material.dart';
import 'package:islami/Features/libarary/presentation/views/widgets/library-item.dart';
import 'package:islami/Features/libarary/presentation/views/widgets/library_images.dart';

class LibararyPage extends StatelessWidget {
  const LibararyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 60,),
            libraryItem(
              image: 'assets/images/cropped_book_icon.png',
              text: "Al- Qur'an",
            ),
            SizedBox(height: 60,),
            libraryItem(
              text: "Al- Tafsir",
              image: 'assets/images/book 1.png',
              textColor: Colors.black, 
            ),
            LibraryImages()
          ],
        ),
      ),
    );
  }
}
