import 'package:flutter/material.dart';

import 'package:islami/core/constant/my_color.dart';

// ignore: must_be_immutable
class WidgetNanigationBar extends StatelessWidget {
  WidgetNanigationBar(
      {super.key,
      required this.nextFun,
      required this.firstNum,
      required this.previousFun});

  void Function() nextFun;
  void Function() previousFun;
  final String firstNum;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: nextFun,
          icon: const Icon(
            Icons.arrow_circle_right_rounded,
            color: Mycolors.green,
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
                    '50 ',
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
                    firstNum,
                    style: TextStyle(color: Mycolors.green),
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
            color: Mycolors.green,
            size: 50,
          ),
        ),
      ],
    );
  }
}

class WdgetNanigationBar extends StatelessWidget {
  WdgetNanigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_circle_right_rounded,
            color: Mycolors.green,
            size: 50,
          ),
        ),
        Flexible(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
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
                  '50 ',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              ElevatedButton(
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
                  '',
                  style: TextStyle(color: Mycolors.green),
                ),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_circle_left_rounded,
            color: Mycolors.green,
            size: 50,
          ),
        ),
      ],
    );
  }
}
