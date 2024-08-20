import 'package:flutter/widgets.dart';

class AdhanTime extends StatelessWidget {
  const AdhanTime({
    Key? key,
    required this.adhanname,
    required this.icon,
    required this.adhandate,
  }) : super(key: key);

  final String adhanname;
  final IconData icon;
  final String adhandate;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(icon, size: 30),
        Text(adhanname,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
        Text(adhandate,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
