import 'package:flutter/cupertino.dart';
import 'package:islami/core/constant/my_color.dart';

class TasbihAppbar extends StatelessWidget {
  const TasbihAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(children: [ Center(
                child: Text(
              'Tasbih ',
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Mycolors.green,
                  fontFamily: 'NotoNastaliqUrdu'),
            )),],);
  }
}