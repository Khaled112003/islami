import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:islami/Features/libarary/presentation/views/widgets/library-item.dart';
import 'package:islami/Features/libarary/presentation/views/widgets/library_images.dart';

class LibararyPage extends StatelessWidget {
  const LibararyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            GestureDetector(
              onTap: () {
                GoRouter.of(context).go('/QuranPage');
              },
              child: const libraryItem(
                image: 'assets/images/cropped_book_icon.png',
                text: "Al- Qur'an",
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            const libraryItem(
              text: "Al- Tafsir",
              image: 'assets/images/book 1.png',
              textColor: Color.fromARGB(255, 24, 16, 16),
            ),
            const LibraryImages()
          ],
        ),
      ),
    );
  }
}
