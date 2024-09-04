import 'package:flutter/material.dart';
import 'package:islami/core/constant/my_color.dart';

class WidgetNanigationBar extends StatelessWidget {
  WidgetNanigationBar({
    super.key,
    required this.nextFun,
    required this.previousFun,
    required this.currentNum,
     this.lastItemNumber,
  });

  final void Function() nextFun;
  final void Function() previousFun;
  final String currentNum;
  final String? lastItemNumber;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [IconButton(
          onPressed: nextFun,
          icon: const Icon(
            Icons.arrow_circle_right_rounded,
             color:Mycolors.green,
            size: 50,
          ),
        ),
        
        Flexible(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFF4F4F4),
                    elevation: 5,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        bottomLeft: Radius.circular(8),
                      ),
                    ),
                  ),
                  child: Text(
                    lastItemNumber??'50', // Show the last item number
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFF4F4F4),
                    elevation: 5,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                    ),
                  ),
                  child: Text(
                    currentNum,
                    style: TextStyle( color:Mycolors.green,),
                  ),
                ),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: previousFun,
          icon: const Icon(
            Icons.arrow_circle_left_rounded,
            color:Mycolors.green,
            size: 50,
          ),
        ),
      ],
    );
  }
}
