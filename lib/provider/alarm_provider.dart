//provider for state management

import 'dart:convert';

import 'package:alarmapp/view/alarm_screen.dart';
//import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart' as tz;

import '../model/alarm_model.dart';

class AlarmProvider extends ChangeNotifier {
  late SharedPreferences preferences;
  List<Model> modeList = [];
  List<String> listofstring = [];
  FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;
  late BuildContext context;

  //function to set alarm
  SetAlarm(String label, String dateTime, bool check, String repeat, int id,
      int milliseconds, DateTime notificationTime) {
    modeList.add(Model(
        label: label,
        dateTime: dateTime,
        check: check,
        when: repeat,
        id: id,
        milliseconds: milliseconds));
    notifyListeners();
    setData();
    scheduleNotification(notificationTime, id);
    notifyListeners();
  }

//function to edit alarm
  editAlarm(Model item, String label, String dateTime, bool check,
      String repeat, int id, int milliseconds, DateTime? notificationTime) {
    if (notificationTime != null) {
      deleteAlarm(item);
      SetAlarm(
          label, dateTime, check, repeat, id, milliseconds, notificationTime);
      notifyListeners();
    }
  }

//function to delete alarm
  deleteAlarm(Model item) {
    modeList.remove(item);
    cancelNotification(item.id!);
    notifyListeners();
  }

//function for repeating alarm
  editSwitch(int index, bool check) {
    modeList[index].check = check;
    notifyListeners();
  }

  //function to retrieve alarm stored in persistent storage(Shared Preferences)
  getData() async {
    preferences = await SharedPreferences.getInstance();
    List<String>? comingList = await preferences.getStringList('data');
    if (comingList == null) {
    } else {
      modeList = comingList.map((e) => Model.fromJson(json.decode(e))).toList();
      notifyListeners();
    }
  }

//function to store alarm stored in persistent storage(Shared Preferences)
  setData() async {
    preferences = await SharedPreferences.getInstance();
    listofstring = modeList.map((e) => json.encode(e.toJson())).toList();
    preferences.setStringList('data', listofstring);
    print("list of string " + listofstring.toString());
    notifyListeners();
  }

//function for local notifications
  initUtilize(con) async {
    context = con;
    var androidInitilize = AndroidInitializationSettings('@mipmap/ic_launcher');
    //var iOsinitilize = DarwinInitializationSettings();
    var initilizationsSettings =
        InitializationSettings(android: androidInitilize);
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin!.initialize(initilizationsSettings,
        onDidReceiveNotificationResponse: onDidReceiveNotificationResponse);
  }

  void onDidReceiveNotificationResponse(
      NotificationResponse notificationResponse) async {
    final String? payload = notificationResponse.payload;
    if (notificationResponse.payload != null) {
      debugPrint('notification payload:$payload');
    }
    await Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (context) => MyApp(),
        ));
  }

  Future<void>  showNotification() async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'your channel id',
      'your channel name',
      channelDescription: 'your channel description',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );

    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await flutterLocalNotificationsPlugin!.show(
        0, 'plain title', 'plain body', notificationDetails,
        payload: 'item x');
  }

  scheduleNotification(DateTime dateTime, int randomNum) async {
    //random number is set as notification id
    int newtime =
        dateTime.millisecondsSinceEpoch - DateTime.now().millisecondsSinceEpoch;
    await flutterLocalNotificationsPlugin!.zonedSchedule(
        randomNum,
        'Alarm Clock',
        "${DateFormat().format(DateTime.now())}",
        tz.TZDateTime.now(tz.local).add(Duration(milliseconds: newtime)),
        const NotificationDetails(
            android: AndroidNotificationDetails(
                'alarm notif', 'alarm notif',
                channelDescription: 'channel for alarm notif',
                sound: RawResourceAndroidNotificationSound("alarm"),
                autoCancel: false,
                playSound: true,
                priority: Priority.max)),
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  cancelNotification(int notificationId) async {
    await flutterLocalNotificationsPlugin!.cancel(notificationId);
  }
}
