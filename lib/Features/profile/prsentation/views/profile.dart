import 'package:flutter/material.dart';
import 'package:islami/Features/profile/prsentation/views/widget/profile_content.dart';
import 'package:islami/Features/profile/prsentation/views/widget/userd_details.dart';
import 'package:islami/core/widgets/button_item.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 40),
          const UserImage(),
        const  UserDetails(),
        
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: ButtonItem(text: 'Save', onPressed: () {}),
        ),
        ],
      ),
    );
  }
}
