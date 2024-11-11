import 'package:flutter/material.dart';

class ForgetPassImage extends StatelessWidget {
  const ForgetPassImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       const SizedBox(height: 15,),
      Row(mainAxisAlignment: MainAxisAlignment.end,
        children:[ Image.asset(
          "assets/images/key.png",
          height: 130,
        ),]
      ),
      
      Container(height: MediaQuery.of(context).size.height*0.3 ,
        child: Image.asset(
          "assets/images/Forgot password-pana.png",
          
          
          
        ),
      )
    ]);
  }
}