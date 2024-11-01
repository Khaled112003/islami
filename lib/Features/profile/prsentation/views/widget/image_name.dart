import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/Features/profile/prsentation/views/widget/inforamtion_item.dart';

class UserImgAndName extends StatelessWidget {
  const UserImgAndName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: ClipOval(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  width: 200,
                  height: 200,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                  ),
                ),
                const Positioned(
                  top: 16,
                  child: Icon(
                    CupertinoIcons.person_alt,
                    size: 200,
                    color: Color.fromARGB(255, 58, 93, 162),
                  ),
                ),
                const Positioned(
                  right: 35,
                  child: Icon(
                    Icons.edit_rounded,
                    size: 40,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
        const Text(
          "khaled Mohaseb",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 30,),
        const InformationItem(
          name: "khaled mohaseb",
        ),
        const InformationItem(
          name: "khaled@gmail.com",
        )
      ],
    );
  }
}
