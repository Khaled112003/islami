import 'package:flutter/widgets.dart';
import 'package:islami/core/constant/my_color.dart';

class WelcomeMessage extends StatelessWidget {
  const WelcomeMessage({
    super.key, required this.text1, required this.text2,
  });
  final String text1,text2;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Mycolors.welcomeColr.withOpacity(0.03)),
        child: Padding(
          padding:  EdgeInsets.all(9.0),
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
           const   SizedBox(
                height: 70,
              ),
              Text(
               text1,
                style:const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                    color: Mycolors.purpleColor),
              ),
              Text(
               text2,
                style:const TextStyle(
                    fontSize: 14,
                    
                    color: Color.fromARGB(255, 99, 97, 97)
                    ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
