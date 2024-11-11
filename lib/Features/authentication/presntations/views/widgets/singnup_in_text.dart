import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpOrInText extends StatelessWidget {
  const SignUpOrInText({
    super.key, required this.text1, required this.text2, required this.namePage,
  });
  final String text1,text2,namePage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: () {
      return GoRouter.of(context).go(namePage);
    },
      child:  Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [
        
          
         
          const SizedBox(
        height:80,
      ),
          Text(
            text1,
            style:const TextStyle(fontWeight: FontWeight.w600,fontSize: 14),
          ),
          Text(text2,style:const TextStyle(fontWeight: FontWeight.w600 ,color: Colors.red,fontSize: 15),)
        ],
      ),
    );
  }
}
