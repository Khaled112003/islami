import 'package:flutter/material.dart';

import 'package:islami/Features/libarary/presentation/views/widgets/item-image.dart';

class LibraryImages extends StatelessWidget {
  const LibraryImages({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ItemImageForLibrary(
            image: 'assets/images/cropped_book_icon.png',
          ),
          ItemImageForLibrary(
            image: 'assets/images/Frame 1000005866.png',
          )
        ]);
  }
}
