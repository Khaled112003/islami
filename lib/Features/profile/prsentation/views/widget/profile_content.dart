import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/Features/profile/prsentation/views/widget/message.dart';
import 'package:islami/core/widgets/appbar_item.dart';
import 'package:islami/core/widgets/button_item.dart';
import 'inforamtion_item.dart';

class ProfileContent extends StatelessWidget {
  const ProfileContent({Key? key}) :super(key: key);

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
        const Text(
          "Username",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 30),
        const UserInformation(name: "Username Placeholder"),
        const UserInformation(name: "Email Placeholder"),
        const AlertMessage(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: ButtonItem(text: 'Save', onPressed: () {}),
        ),
      ],
    );
  }
}
