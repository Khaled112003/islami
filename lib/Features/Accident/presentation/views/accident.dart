import 'package:flutter/material.dart';
import 'package:islami/Features/Accident/presentation/views/widgets/accident_item.dart';
import 'package:islami/core/widgets/appbar_item.dart';

class Accident extends StatelessWidget {
  const Accident({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child:  Scaffold(
        body: Column(
          children: [
            AppbarItem(text: 'Accident'),
            SizedBox(height: 40),
            AccidentItem(),
          ],
        ),
      ),
    );
  }
}
