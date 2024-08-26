import 'package:flutter/material.dart';
import 'package:islami/Features/Accident/presentation/views/widgets/doaa_item.dart';
import 'package:islami/Features/Accident/presentation/views/widgets/accident_navigationbar.dart';
import 'package:islami/Features/Accident/presentation/views/widgets/wid_navigation.dart';
import 'package:islami/core/widgets/appbar_item.dart';

class Doaa extends StatelessWidget {
  const Doaa({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            AppbarItem(text: 'Doaa'),
            SizedBox(height: 40),
            DoaaItem(),
            SizedBox(height: 30),
            WdgetNanigationBar()
          ],
        ),
      ),
    );
  }
}
