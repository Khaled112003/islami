import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:islami/Features/audios/presentation/views/widget/audio_items.dart';

class AudioPage extends StatelessWidget {
  const AudioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('assets/images/Listen.png'),
                ),
                const SizedBox(height: 20),
                const AudioItem(),
              ],
            ),
            Positioned(
              top: 0,
              left:0 , // جعل الأيقونة في الزاوية العلوية اليسرى
              child: IconButton(
                onPressed: () {
                  GoRouter.of(context).pop();
                },
                icon:const Icon(
                  Icons.arrow_circle_left_outlined,
                  size: 40,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
