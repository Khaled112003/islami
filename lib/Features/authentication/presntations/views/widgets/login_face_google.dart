import 'package:flutter/material.dart';
import 'package:islami/Features/authentication/presntations/views/widgets/image_item.dart';

class LoginWithFaceOrGoogle extends StatelessWidget {
  const LoginWithFaceOrGoogle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [ SizedBox(
      height: 40,
    ),
        Text(
          "Or sign in with..",
          style: TextStyle(color: Color.fromARGB(255, 99, 99, 99)),
        ),SizedBox(height: 20,),
        Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageItem(image: 'assets/images/gogle.png',),
            SizedBox(width: 20,),
            ImageItem(image: 'assets/images/face.png')
          ],
        )
      ],
    );
  }
}

