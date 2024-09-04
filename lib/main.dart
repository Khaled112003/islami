import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:islami/core/constant/my_color.dart';
import 'package:islami/core/utilitis/routes.dart';
import 'package:islami/core/utilitis/singleton_pattern.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initializeFirebase(); // استدعاء تهيئة Firebase بطريقة آمنة
  setup();
  runApp(const IslamiApp());
}

Future<void> _initializeFirebase() async {
  try {
    // تحقق إذا كان هناك تطبيق Firebase موجود مسبقًا
    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: 'AIzaSyAv3Itbsiwl8cKw8ufuW2zKFwgQ2VeI9_E',
          appId: '1:255379998805:android:a4b55d8b14e7af87242cdc',
          messagingSenderId: '255379998805',
          projectId: 'islami-31dfd',
          storageBucket: 'islami-31dfd.appspot.com',
        ),
      );
    }
  } catch (e) {
    print('Error initializing Firebase: $e');
  }
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