import 'package:flutter/material.dart';

class SurahName extends StatelessWidget {
  const SurahName({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(alignment: Alignment.topLeft,
          child: Text(
            'Al-Fātiḥah',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(height: 10,),
        Row(
          children: [
            SurahDetails(
              text: 'makke',
            ), SizedBox(width: 10,),
            
            
            SurahDetails(
              text: '${7} ayat',
            )
          ],
        ),
      ],
    );
  }
}

class SurahDetails extends StatelessWidget {
  const SurahDetails({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 25,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: const Color.fromARGB(255, 187, 184, 184).withOpacity(0.4)),
      child: Center(child: Text(text, style: TextStyle(fontWeight: FontWeight.w400),)),
    );
  }
}
