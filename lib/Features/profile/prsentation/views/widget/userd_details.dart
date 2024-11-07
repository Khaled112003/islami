import 'package:flutter/cupertino.dart';
import 'package:islami/Features/profile/prsentation/views/widget/inforamtion_item.dart';
import 'package:islami/Features/profile/prsentation/views/widget/message.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
const Text(
          "Username",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 30),
        const UserInformation(name: "Username Placeholder"),
        const UserInformation(name: "Email Placeholder"),
        const AlertMessage(),
    ],);
  }
}