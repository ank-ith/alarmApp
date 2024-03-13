import 'package:alarmapp/model/weather_model.dart';
import 'package:alarmapp/service/weather_service.dart';
import 'package:alarmapp/utils/color_constants.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:provider/provider.dart';

import '../provider/alarm_provider.dart';
import 'add_alarm.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _weatherService = WeatherService();
  Weather? _weather;

//get weather data on init state
  _fetchWeather() async {
    String cityName = await _weatherService.getCurrentCity();
    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print('failed to get weather:${e}');
    }
  }

  bool value = false;

  @override
  void initState() {
    _fetchWeather();
    context.read<AlarmProvider>().initUtilize(context);
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {}); //rebuild after getting data
    });

    //super.initState();
    context.read<AlarmProvider>().getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.appBarColor,
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.menu,
              color: Colors.white,
            ),
          )
        ],
        title: const Text(
          'Alarm Clock ',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.3,
          width: double.infinity,
          decoration: BoxDecoration(
              color: AppColor.textColor,
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(10))),
          child: Card(
            elevation: 0,
            color: AppColor.textColor,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // add image for different condition
                  Image.network(
                      fit: BoxFit.scaleDown,
                      width: 90,
                      height: 90,
                      'https://i.pinimg.com/236x/d9/d2/82/d9d282bfd1842ef06e706a12679e7e49.jpg'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${_weather?.latitude}\u00B0\t" ?? 'Nothing to show',
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text('${_weather?.longitude}\u00B0' ?? 'Nothing to show',
                          style: const TextStyle(fontSize: 20)),
                    ],
                  ),
                  Text(
                      '${_weather?.temp.toString()}\u00B0C\t|\t${_weather?.condition}' ??
                          'Nothing to show',
                      style: const TextStyle(fontSize: 25)),
                  Text(
                      '${_weather?.country}, ${_weather?.cityName}' ??
                          'Nothing to show',
                      style: const TextStyle(fontSize: 20)),
                ],
              ),
            ),
          ),
        ),
        Expanded(
            child: ListView(children: [
          Consumer<AlarmProvider>(builder: (context, alarm, child) {
            return SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: ListView.builder(
                    itemCount: alarm.modeList.length,
                    itemBuilder: (BuildContext, index) {
                      return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.1,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColor.containerColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder:
                                                    (context) => //to edit alarm using selected Model
                                                        AddAlarm(
                                                            model:
                                                                alarm.modeList[
                                                                    index]),
                                              ));
                                        },
                                        child: Row(
                                          children: [
                                            Column(
                                              children: [
                                                Text(
                                                  alarm.modeList[index]
                                                      .dateTime!,
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16,
                                                      color: Colors.black),
                                                ),
                                                Row(mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    Icon(Icons.label_important_outline),
                                                    Text(
                                                        alarm
                                                            .modeList[index].label
                                                            .toString(),
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 16,
                                                            color: Colors.black)),
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 90,
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            alarm.deleteAlarm(
                                                alarm.modeList[index]);
                                          },
                                          icon: const Icon(
                                            Icons.delete,
                                          )),
                                      Switch(
                                          activeColor: AppColor.buttonColor,
                                          value: (alarm.modeList[index]
                                                      .milliseconds! <
                                                  DateTime.now()
                                                      .microsecondsSinceEpoch) //to automatically trigger switch after passing the set time
                                              ? false
                                              : alarm.modeList[index].check,
                                          onChanged: (v) {
                                            alarm.editSwitch(index, v);
                                            alarm.cancelNotification(
                                                alarm.modeList[index].id!);
                                          }),
                                    ],
                                  ),
                                  // Text(alarm.modeList[index].when!),
                                ],
                              ),
                            ),
                          ));
                    }));
          }),
        ])),
      ]),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            color: AppColor.appBarColor),
        child: Center(
            child: GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AddAlarm()));
          },
          child: Container(
              decoration: BoxDecoration(
                  color: AppColor.buttonColor, shape: BoxShape.circle),
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Icon(Icons.add),
              )),
        )),
      ),
    );
  }
}
