import 'package:alarmapp/provider/alarm_provider.dart';
import 'package:alarmapp/view/alarm_screen.dart';
//import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:timezone/data/latest_all.dart' as tz;

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 // await AndroidAlarmManager.initialize();
  tz.initializeTimeZones();
  flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
      AndroidFlutterLocalNotificationsPlugin>()!
      .requestNotificationsPermission();

  runApp(
    ChangeNotifierProvider(
    create: (context) => AlarmProvider(),
   child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
    )
  );
}