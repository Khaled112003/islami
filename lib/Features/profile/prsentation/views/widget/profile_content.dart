
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/Features/profile/prsentation/manger/cubit/profile_cubit.dart';
import 'package:islami/Features/profile/prsentation/manger/cubit/profile_state.dart';
import 'package:islami/Features/profile/prsentation/views/widget/message.dart';
import 'package:islami/core/widgets/appbar_item.dart';
import 'package:islami/core/widgets/button_item.dart';
import 'inforamtion_item.dart';

class ProfileContent extends StatelessWidget {
  final String userName;
  final String email;
  final String uid;
  final String? photoUrl;

  const ProfileContent({
    super.key,
    required this.userName,
    required this.email,
    required this.uid,
    this.photoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppbarItem(text: "Personal Information", onPressed: () {}, size: 20),
        const SizedBox(height: 50),
        Center(
          child: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              Widget imageWidget;
              String? imageUrl = photoUrl;

              // التحكم في عرض الصورة فقط دون التأثير على البيانات الأخرى
              if (state is ProfileLoaded) {
                imageUrl = state.user.profileImage;
              }

              // أثناء التحميل، عرض مؤشر التحميل بدلاً من الصورة
              if (state is ProfileImageUploading) {
                imageWidget = const CircularProgressIndicator();
              } else {
                // عرض الصورة بناءً على توفر الرابط أو الأيقونة الافتراضية
                imageWidget = Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    image: imageUrl != null
                        ? DecorationImage(
                            image: NetworkImage(imageUrl), // استخدام NetworkImage للصورة
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                  child: imageUrl == null
                      ? const Icon(
                          CupertinoIcons.person_alt,
                          size: 100,
                          color: Color.fromARGB(255, 58, 93, 162),
                        )
                      : null,
                );
              }

              return ClipOval(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    imageWidget,
                    Positioned(
                      right: 35,
                      child: IconButton(
                        icon: const Icon(
                          Icons.edit_rounded,
                          size: 40,
                          color: Colors.black,
                        ),
                        onPressed: () =>
                            context.read<ProfileCubit>().pickAndUploadImage(uid),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 20),
        Text(
          userName,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 30),
        UserInformation(name: userName),
        UserInformation(name: email),
        const AlertMessage(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: ButtonItem(text: 'Save', onPressed: () {}),
        ),
      ],
    );
  }
}
