import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/Features/profile/data/repo/profile_repo.dart';
import 'package:islami/Features/profile/prsentation/manger/user_image/user_info_cubit.dart';
import 'package:islami/Features/profile/prsentation/manger/user_info/profile_cubit.dart';
import 'package:islami/Features/profile/prsentation/views/widget/user_image.dart';
import 'package:islami/Features/profile/prsentation/views/widget/userd_details.dart';
import 'package:islami/core/widgets/button_item.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final String? uid = FirebaseAuth.instance.currentUser?.uid;

    if (uid == null) {
      return const Center(child: Text("Please log in to view your profile"));
    }

   return MultiBlocProvider(
  providers: [
    BlocProvider(
      create: (context) => InfoCubit(ProfileRepo())..fetchUserData(uid),
    ),
    BlocProvider(
      create: (context) => UserImageCubit(ProfileRepo()),
    ),
  ],
  child: Scaffold(
    body: Column(
      children: [
        const SizedBox(height: 40),
        const UserImage(),
        const UserDetails(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Builder(
            builder: (context) => ButtonItem(
              text: 'Save',
              onPressed: () {
                context.read<UserImageCubit>().uploadProfileImage(uid);
              },
            ),
          ),
        ),
      ],
    ),
  ),
);
  }
}