// استيراد الحزم المطلوبة
import 'dart:async';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:islami/Features/home/data/model/prayer_time_model/prayer_time_model.dart';
import 'package:islami/core/utilitis/routes.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter/material.dart';

// كلاس مسؤول عن إدارة إشعارات التطبيق
class LocalNotificationService {
  // إنشاء instance من FlutterLocalNotificationsPlugin للتحكم في كل الإشعارات
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // stream لنقل بيانات عند الضغط على الإشعار
  static StreamController<NotificationResponse> streamController =
      StreamController();

  // دالة تُنفذ عند الضغط على إشعار
  static onTap(NotificationResponse notificationResponse) {
  final route = notificationResponse.payload;

  if (route != null && route.isNotEmpty) {
    streamController.add(notificationResponse);

    Future.delayed(const Duration(milliseconds: 500), () {
      navigatorKey.currentState?.pushNamed(route);
    });
  }
}

  // تهيئة إعدادات الإشعارات على مستوى النظام
  static Future init() async {
    InitializationSettings settings = const InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'), // إعدادات أندرويد
      iOS: DarwinInitializationSettings(), // إعدادات iOS
    );

    // ربط الإشعارات بالإعدادات ودوال الرد على الضغط
    flutterLocalNotificationsPlugin.initialize(
      settings,
      onDidReceiveNotificationResponse: onTap, // عند الضغط داخل التطبيق
      onDidReceiveBackgroundNotificationResponse: onTap, // عند الضغط والتطبيق في الخلفية
    );
  }

  // جدولة إشعار لصلاة معينة حسب الوقت المرسل من API
  static Future<void> schedulePrayerNotification(
      String title, String time, int id) async {
    
    // تحميل المناطق الزمنية
    tz.initializeTimeZones();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(currentTimeZone)); // تعيين التوقيت المحلي

    final now = tz.TZDateTime.now(tz.local); // الوقت الحالي

    // تحويل النص "4:26 am" إلى TimeOfDay
    final parsedTime = TimeOfDay(
      hour: int.parse(time.split(":")[0]),
      minute: int.parse(time.split(":")[1].split(" ")[0]),
    );

    final isPM = time.toLowerCase().contains('pm'); // هل الوقت مساءً
    final hour24 = isPM && parsedTime.hour != 12
        ? parsedTime.hour + 12
        : !isPM && parsedTime.hour == 12
            ? 0
            : parsedTime.hour;

    // إنشاء وقت الإشعار الفعلي بناءً على التاريخ والساعة
    var scheduleTime = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      hour24,
      parsedTime.minute,
    );

    // لو الوقت عدى، جدوله لبكره
    if (scheduleTime.isBefore(now)) {
      scheduleTime = scheduleTime.add(const Duration(days: 1));
    }

    // إعداد تفاصيل الإشعار
    const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'adhan_channel', // id للقناة
      'Prayer Time Notifications', // اسم القناة
      importance: Importance.max,
      priority: Priority.high,
      
    );

    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidDetails);

    // جدولة الإشعار باستخدام zonedSchedule
    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      'حان الآن موعد $title',
      scheduleTime,
      notificationDetails,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      payload: '/',
      
      matchDateTimeComponents: DateTimeComponents.time, 
    ); 
  }

  // جدولة تذكير ثابت الساعة 10 صباحًا
  static Future<void> scheduleDailyReminderAt11_55PM() async {
  tz.initializeTimeZones();
  final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
  tz.setLocalLocation(tz.getLocation(currentTimeZone));

  final now = tz.TZDateTime.now(tz.local);
  var scheduleTime = now.add(const Duration(seconds: 10));
  if (scheduleTime.isBefore(now)) {
    scheduleTime = scheduleTime.add(const Duration(days: 1));
  }

  const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
    'daily_reminder',
    'Daily Reminder',
    importance: Importance.max,
    priority: Priority.high,
  );

  const NotificationDetails details = NotificationDetails(android: androidDetails);

  await flutterLocalNotificationsPlugin.zonedSchedule(
    100,
    'تذكير يومي',
    'لا تنس أذكارك وأدعيتك اليوم!',
    scheduleTime,
    details,
    androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    matchDateTimeComponents: null,
     payload: '/Accident'
     
   
  );
}


  // إلغاء إشعار معين برقم الـ ID
  static Future<void> cancelNotification(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }
}
void scheduleAllAdhanNotifications(PrayerTimeModel adhan) {
  LocalNotificationService.schedulePrayerNotification('الفجر', adhan.fajr, 1);
  LocalNotificationService.schedulePrayerNotification('الشروق', adhan.shurooq, 2);
  LocalNotificationService.schedulePrayerNotification('الظهر', adhan.dhuhr, 3);
  LocalNotificationService.schedulePrayerNotification('العصر', adhan.asr, 4);
  LocalNotificationService.schedulePrayerNotification('المغرب', adhan.maghrib, 5);
  LocalNotificationService.schedulePrayerNotification('العشاء', adhan.isha, 6);
}