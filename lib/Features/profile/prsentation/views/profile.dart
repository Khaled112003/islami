import 'package:flutter/material.dart';

import 'widget/image_name.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          UserImgAndName(),
          
        ],
      ),
    );
  }
}


