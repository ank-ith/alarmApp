import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AddAlarm extends StatefulWidget {
  const AddAlarm({super.key});

  @override
  State<AddAlarm> createState() => _AddAlarmState();
}

class _AddAlarmState extends State<AddAlarm> {
  late TextEditingController controller;
  String? dateTime;
  bool repeat = false;
  DateTime? notificationTime;
  String? name = 'none';
  int? milliseconds;

  @override
  void initState() {
    controller = TextEditingController();
    //context.read<AlarmProvider>.GetData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.check),
          )
        ],
        automaticallyImplyLeading: true,
        title: Text(
          'add alarm',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.height,
            child: Center(
              child: CupertinoDatePicker(
                onDateTimeChanged: (va) {
                  dateTime = DateFormat().add_jms().format(va);
                  milliseconds = va.microsecondsSinceEpoch;
                  notificationTime = va;
                  print(dateTime);
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: CupertinoTextField(
                placeholder: 'Add Label',
                controller: controller,
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Repeat Daily'),
              ),
              CupertinoSwitch(
                value: repeat,
                onChanged: (bool value) {
                  repeat = value;
                  if (repeat == false) {
                    name = 'none';
                  } else {
                    name = 'EveryDay';
                  }
                  setState(() {});
                },
              ),
              ElevatedButton(
                  onPressed: () {
                    Random random = Random();
                    int randomNumber = random.nextInt(100);
                    //context.read<AlarmProvider>().setData();
                    //context.read()<AlarmProvider>().ScheduleNotifcation(notificationTime!,randomNumber);
                   // Navigator.pop(context);
                  },
                  child: Text('Set Alarm'))
            ],
          )
        ],
      ),
    );
  }
}
