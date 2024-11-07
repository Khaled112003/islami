import 'package:flutter/material.dart';
import 'package:islami/Features/profile/prsentation/views/widget/profile_content.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 40),
          const ProfileContent(),
        ],
      ),
    );
  }
}
