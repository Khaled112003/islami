import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LibararyPage extends StatelessWidget {
  const LibararyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        LibararyRectangel(),
      ],
    );
  }
}

class LibararyRectangel extends StatelessWidget {
  const LibararyRectangel({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius:
              BorderRadius.circular(16.0), 
          child: Image.asset(
            'assets/images/Rectangle.png', height: 200,
            fit: BoxFit.cover,
          ),
        ),Positioned(right: -25,
          child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Image.asset(
              'assets/images/fawanes.png',
              height: 180,
            )
          ]),
        ),
        const Positioned(top: 30, left: 10,
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Libarary',
              style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'This page includes everything \n you need in the application ',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ],
        )),
        
      ],
    );
  }
}
