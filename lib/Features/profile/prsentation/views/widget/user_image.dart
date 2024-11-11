import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/core/widgets/appbar_item.dart';
import 'dart:io';

import '../../manger/user_image/user_info_cubit.dart';

class UserImage extends StatelessWidget {
  const UserImage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserImageCubit, UserImageState>(
      builder: (context, state) {
        final cubit = context.read<UserImageCubit>();

        return Column(
          children: [
            AppbarItem(
              text: "Personal Information",
              onPressed: () {},
              size: 20,
            ),
            const SizedBox(height: 50),
            Center(
              child: ClipOval(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                      ),
                      child: state is PickImageSuccess && state.image != null
                          ? Image.file(
                              File(state.image!.path),
                              fit: BoxFit.cover,
                            )
                          : const Icon(
                              CupertinoIcons.person_alt,
                              size: 100,
                              color: Color.fromARGB(255, 58, 93, 162),
                            ),
                    ),
                    Positioned(
                      right: 35,
                      child: IconButton(
                        icon: const Icon(
                          Icons.edit_rounded,
                          size: 40,
                          color: Colors.black,
                        ),
                        onPressed: () async {
                          await cubit.pickImage();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            if (state is UploadProfileImageLoading)
              const CircularProgressIndicator(),
            if (state is UploadProfileImageFailure)
              Text(
                state.errorMessage,
                style: const TextStyle(color: Colors.red),
              ),
          ],
        );
      },
    );
  }
}
