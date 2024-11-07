import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/core/widgets/appbar_item.dart';

class UserImage extends StatelessWidget {
  const UserImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppbarItem(text: "Personal Information", onPressed: () {}, size: 20),
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
                  child: const Icon(
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
                    onPressed: () {
                     
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
       
      ],
    );
  }
}

