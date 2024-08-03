import 'package:flutter/material.dart';
import 'package:islami/core/constant/my_color.dart';
import 'package:islami/core/utilitis/routes.dart';

void main() {
  runApp(const IslamiApp());
}

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor:Mycolors.myWhite,
        textTheme: ThemeData.light().textTheme.apply(
              bodyColor: Colors.black,   
              displayColor: Colors.black,
            ),
      ),
    );
  }
}
