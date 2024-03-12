import 'package:alarmapp/view/alarm_screen.dart';
import 'package:flutter/material.dart';

import 'dart:async';

//import 'package:alaram/Model/Model.dart';
//import 'package:alaram/Provider/Provier.dart';
//import 'package:alaram/Screen/Add_Alarm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//import 'package:intl/intl.dart';
//import 'package:provider/provider.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:timezone/timezone.dart' as tz;
// import 'package:timezone/data/latest_all.dart' as tz;

// import 'package:another_flushbar/flushbar.dart';

// FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
// FlutterLocalNotificationsPlugin();

void main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  // tz.initializeTimeZones();
  // flutterLocalNotificationsPlugin
  //     .resolvePlatformSpecificImplementation<
  //     AndroidFlutterLocalNotificationsPlugin>()!
  //     .requestNotificationsPermission();

  runApp(
    //ChangeNotifierProvider(
    //create: (contex) => alarmprovider(),
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
    //)
  );
}