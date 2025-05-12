import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/Features/home/presentation/manger/dashboard/dashboardbody_cubit.dart';

import 'package:islami/core/constant/my_color.dart';
import 'package:islami/core/utilitis/local_notification.dart';
import 'package:islami/core/utilitis/routes.dart';
import 'package:islami/core/utilitis/shared_Preferences.dart';
import 'package:islami/core/utilitis/singleton_pattern.dart';
import 'package:islami/core/utilitis/work_manger.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefsHelper.init();
   await LocalNotificationService.init();
   await WorkManagerService().init(); 
  await _initializeFirebase();
  setup();
  runApp(const IslamiApp());
}

Future<void> _initializeFirebase() async {
  try {
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
    return BlocProvider(
      create: (context) => DashboardCubit(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: Mycolors.myWhite,
          textTheme: ThemeData.light().textTheme.apply(
                bodyColor: Colors.black,
                displayColor: Colors.black,
              ),
        ),
      ),
    );
  }
}
