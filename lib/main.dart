import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:islami/core/constant/my_color.dart';
import 'package:islami/core/utilitis/routes.dart';
import 'package:islami/core/utilitis/singleton_pattern.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: FirebaseOptions(
    apiKey: 'key',
    appId: 'id',
    messagingSenderId: 'sendid',
    projectId: 'myapp',
    storageBucket: 'myapp-b9yt18.appspot.com',
  )
);
  setup();
  runApp(IslamiApp());

}


class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router( 

      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: ThemeData.light().copyWith(  

        scaffoldBackgroundColor: Mycolors.myWhite,
        textTheme: ThemeData.light().textTheme.apply(
          bodyColor: Colors.black,
          displayColor: Colors.black,
        ),
      ),
    );
  }
}