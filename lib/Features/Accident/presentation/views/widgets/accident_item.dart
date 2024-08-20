import 'package:flutter/material.dart';
import 'package:islami/Features/Accident/presentation/views/widgets/elrawe&status.dart';
import 'package:islami/core/constant/my_color.dart';

class AccidentItem extends StatelessWidget {
  const AccidentItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 380,
          height: MediaQuery.of(context).size.height * 0.65,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Mycolors.prayertime,
          ),
          child: const Padding(
            padding: EdgeInsets.only(left: 8, top: 5, right: 8, bottom: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'سُئِلَ عمرُ بنُ الخطابِ رضيَ اللهُ عنه عن طعامِ العُرسِ فقيل : يا أميرَ المؤمنين : ما [ بالُ ] طعامِ العُرسِ أطيبُ من ريحِ طعامِنا ؟ فقال سمعتُ رسولَ اللهِ صلَّى اللهُ عليهِ وسلَّمَ يقول : في طعامِ العُرسِ مثقالٌ من ريحِ الجنَّةِ ، قال عمرُ رضيَ اللهُ عنه : دعا له إبراهيمُ الخليلُ عليه الصلاةُ والسلامُ ، ومحمدٌ صلَّى اللهُ عليهِ وسلَّم أن يُبارِكَ فيه ويُطَيِّبَه',
                  textDirection: TextDirection.rtl,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                ElraweAndstatus()
              ],
            ),
          ),
        )
      ],
    );
  }
}
