import 'package:flutter/material.dart';

class OnboardingContent extends StatelessWidget {
  final int screenIndex;

  const OnboardingContent({Key? key, required this.screenIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (screenIndex) {
      case 0:
        return _buildScreen(
          context,
          title: 'مرحبا بك في تطبيق إسلامي',
          description: 'تطبيقك لمتابعة أوقات الصلاة وقراءة الأذكار.',
          imagePath: 'assets/images/quran.png',
        );
      case 1:
        return _buildScreen(
          context,
          title: 'أوقات الصلاة',
          description: 'احصل على تنبيهات دقيقة لأوقات الصلاة في مدينتك.',
          imagePath: 'assets/images/quran.png',
        );
      case 2:
        return _buildScreen(
          context,
          title: 'الأذكار اليومية',
          description: 'اقرأ الأذكار الصباحية والمسائية بسهولة.',
          imagePath: 'assets/images/quran.png',
        );
      default:
        return Container();
    }
  }

  Widget _buildScreen(BuildContext context, {required String title, required String description, required String imagePath}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath, height: 200),
          SizedBox(height: 30),
          Text(title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 16),
          Text(description, style: TextStyle(fontSize: 18), textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
