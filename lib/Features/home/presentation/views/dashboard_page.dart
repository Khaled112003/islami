import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/Features/home/presentation/views/widgets/home_body.dart';

class DashoardPage extends StatelessWidget {
  const DashoardPage({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: PageView(
          children: [DashboardBody()],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home), label: 'home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_books_outlined), label: 'favorite'),
        ],
      ),
    );
  }
}
