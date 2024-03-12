import 'package:alarmapp/utils/color_constants.dart';
import 'package:flutter/material.dart';

import 'dart:async';

//import 'package:alaram/Model/Model.dart';
//import 'package:alaram/Provider/Provier.dart';
//import 'package:alaram/Screen/Add_Alarm.dart';
import 'package:flutter/material.dart';

import 'add_alarm.dart';

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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool value = false;

  // @override
  // void initState() {
  //   context.read<alarmprovider>().Inituilize(context);
  //   Timer.periodic(Duration(seconds: 1), (timer) {
  //     setState(() {});
  //   });
  //
  //   super.initState();
  //   context.read<alarmprovider>().GetData();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.bgColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColor.appBarColor,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
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
        body: ListView(children: [

          //Consumer<alarmprovider>(builder: (context, alarm, child) {
          // return
          Container(
              height: MediaQuery.of(context).size.height * 0.15,
              // child: ListView.builder(
              // itemCount:4
              //alarm.modelist.length,
              // itemBuilder: (BuildContext, index) {
              //return
              child: Padding(
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'XXXXXX'
                                      //alarm.modelist[index].dateTime!,
                                      ,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.black),
                                    ),
                                    Padding(
                                        padding:
                                        const EdgeInsets.only(left: 8.0),
                                        child: Text("XXX| XXX"
                                          //    alarm.modelist[index].label
                                          //       .toString()),
                                        )),
                                  ],
                                ),
                                Switch(activeColor: AppColor.buttonColor,
                                    value: true
                                    //(alarm.modelist[index].milliseconds! < DateTime.now().microsecondsSinceEpoch)? false:alarm.modelist[index].check,
                                    ,
                                    onChanged: (v) {
                                      //alarm.EditSwitch(index, v);

                                      // alarm.CancelNotification(alarm.modelist[index].id!);
                                    }),
                              ],
                            ),
                            Text('XXXXXX'
                              //alarm.modelist[index].when!
                            )
                            //       ],
                            //     ),
                            //   ),
                            // ))
                            //         }),
                            //   );
                            // }),
                            ,
                          ],
                        ),
                      )))),
          Container(
              height: MediaQuery.of(context).size.height * 0.15,
              // child: ListView.builder(
              // itemCount:4
              //alarm.modelist.length,
              // itemBuilder: (BuildContext, index) {
              //return
              child: Padding(
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'XXXXXX'
                                      //alarm.modelist[index].dateTime!,
                                      ,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.black),
                                    ),
                                    Padding(
                                        padding:
                                        const EdgeInsets.only(left: 8.0),
                                        child: Text("XXX| XXX"
                                          //    alarm.modelist[index].label
                                          //       .toString()),
                                        )),
                                  ],
                                ),
                                Switch(activeColor: AppColor.buttonColor,
                                    value: true
                                    //(alarm.modelist[index].milliseconds! < DateTime.now().microsecondsSinceEpoch)? false:alarm.modelist[index].check,
                                    ,
                                    onChanged: (v) {
                                      //alarm.EditSwitch(index, v);

                                      // alarm.CancelNotification(alarm.modelist[index].id!);
                                    }),
                              ],
                            ),
                            Text('XXXXXX'
                              //alarm.modelist[index].when!
                            )
                            //       ],
                            //     ),
                            //   ),
                            // ))
                            //         }),
                            //   );
                            // }),
                            ,
                          ],
                        ),
                      )))),

          // Container(
          //     height: MediaQuery.of(context).size.height * 0.7,
          //     // child: ListView.builder(
          //     // itemCount:4
          //     //alarm.modelist.length,
          //     // itemBuilder: (BuildContext, index) {
          //     //return
          //     child: Padding(
          //         padding: const EdgeInsets.all(8.0),
          //         child: Container(
          //             height: MediaQuery.of(context).size.height * 0.1,
          //             decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(10),
          //               color: Colors.white,
          //             ),
          //             child: Padding(
          //               padding: const EdgeInsets.all(8.0),
          //               child: Column(
          //                 mainAxisAlignment: MainAxisAlignment.center,
          //                 crossAxisAlignment: CrossAxisAlignment.start,
          //                 children: [
          //                   Row(
          //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                     children: [
          //                       Row(
          //                         children: [
          //                           Text(
          //                             'XXXXXX'
          //                             //alarm.modelist[index].dateTime!,
          //                             ,
          //                             style: TextStyle(
          //                                 fontWeight: FontWeight.bold,
          //                                 fontSize: 16,
          //                                 color: Colors.black),
          //                           ),
          //                           Padding(
          //                               padding:
          //                               const EdgeInsets.only(left: 8.0),
          //                               child: Text("XXX| XXX"
          //                                 //    alarm.modelist[index].label
          //                                 //       .toString()),
          //                               )),
          //                         ],
          //                       ),
          //                       CupertinoSwitch(
          //                           value: true
          //                           //(alarm.modelist[index].milliseconds! < DateTime.now().microsecondsSinceEpoch)? false:alarm.modelist[index].check,
          //                           ,
          //                           onChanged: (v) {
          //                             //alarm.EditSwitch(index, v);
          //
          //                             // alarm.CancelNotification(alarm.modelist[index].id!);
          //                           }),
          //                     ],
          //                   ),
          //                   Text('XXXXXX'
          //                     //alarm.modelist[index].when!
          //                   )
          //                   //       ],
          //                   //     ),
          //                   //   ),
          //                   // ))
          //                   //         }),
          //                   //   );
          //                   // }),
          //                   ,
          //                 ],
          //               ),
          //             ))))


          //,

        ]),
    bottomNavigationBar: Container(
    height: MediaQuery.of(context).size.height * 0.1,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.only(
    topLeft: Radius.circular(30),
    topRight: Radius.circular(30)),
    color: AppColor.appBarColor),
    child: Center(
    child: GestureDetector(
    onTap: () {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => AddAlarm()));
    },
    child: Container(
    decoration: BoxDecoration(
    color: AppColor.buttonColor,
    shape: BoxShape.circle),
    child: Padding(
    padding: const EdgeInsets.all(12.0),
    child: Icon(Icons.add),
    )),
    )),
    ) ,);
  }
}
