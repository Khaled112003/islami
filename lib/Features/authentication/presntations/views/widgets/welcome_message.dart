import 'package:flutter/widgets.dart';
import 'package:islami/core/constant/my_color.dart';

class WelcomeMessage extends StatelessWidget {
  const WelcomeMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Mycolors.welcomeColr.withOpacity(0.03)),
        child:const Padding(
          padding:  EdgeInsets.all(9.0),
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome',
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                    color: Mycolors.purpleColor),
              ),
              Text(
                ' We pray that what we offer benefits you and makes your use of the app easy and rewarding.',
                style: TextStyle(
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
