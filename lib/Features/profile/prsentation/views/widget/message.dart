import 'package:flutter/cupertino.dart';

class AlertMessage extends StatelessWidget {
  const AlertMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
            "When you set up your personal information settings, you should take care to provide accurate information."),
     SizedBox(height: 50,) ],
    );
  }
}
