import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../model/alarm_model.dart';
import '../provider/alarm_provider.dart';

class AddAlarm extends StatefulWidget {
  const AddAlarm({super.key, this.model});

  final Model? model;

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
        actions: [],
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
                onDateTimeChanged: (dateTimeValue) {
                  dateTime = DateFormat().add_jms().format(dateTimeValue);
                  milliseconds = dateTimeValue.microsecondsSinceEpoch;
                  notificationTime = dateTimeValue;
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
                    if (widget.model == null) {
                      //run if there is a model present i.e runs for edit functionality
                      Random random = Random();
                      int randomNumber = random.nextInt(100);

                      context.read<AlarmProvider>().SetAlarm(
                          controller.text,
                          dateTime!,
                          true,
                          name!,
                          randomNumber,
                          milliseconds!,
                          notificationTime!);
                      // context.read<AlarmProvider>().SetData();

                      // context
                      //     .read<AlarmProvider>()
                      //     .scheduleNotification(notificationTime!, randomNumber);

                      Navigator.pop(context);
                    } else {
                      //runs for setting a new alarm
                      Random random = Random();
                      int randomNumber = random.nextInt(100);
                      context.read<AlarmProvider>().editAlarm(
                          widget.model!,
                          controller.text,
                          dateTime ?? widget.model!.dateTime!,
                          true,
                          name!,
                          randomNumber,
                          widget.model!.milliseconds!,
                          notificationTime);
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Set Alarm'))
            ],
          )
        ],
      ),
    );
  }
}
