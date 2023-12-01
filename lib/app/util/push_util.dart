// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:monglee/app/config/constants.dart';
// import 'package:monglee/app/config/moglee_color.dart';
// import 'package:monglee/app/extensions/todo_noti_time.dart';
// import 'package:monglee/app/extensions/todo_repeat.dart';
// import 'package:monglee/app/util/monglee_logger.dart';
// import 'package:timezone/standalone.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;
// import 'package:timezone/tzdata.dart' as tz;
// import 'package:timezone/standalone.dart';
//
// @pragma('vm:entry-point')
// class PushUtil {
//   static final PushUtil _pushUtil = PushUtil._();
//
//   PushUtil._();
//
//   factory PushUtil() => _pushUtil;
//
//   static final FlutterLocalNotificationsPlugin _pushPlugin =
//       FlutterLocalNotificationsPlugin();
//
//   static void initPush() async {
//     AndroidInitializationSettings aosSettings =
//         const AndroidInitializationSettings('@mipmap/ic_launcher');
//     DarwinInitializationSettings iosSetting =
//         const DarwinInitializationSettings(
//             onDidReceiveLocalNotification: onDidReceiveLocalNotification);
//     await _pushPlugin.initialize(
//         InitializationSettings(android: aosSettings, iOS: iosSetting),
//         onDidReceiveNotificationResponse: notificationResponse,
//         onDidReceiveBackgroundNotificationResponse: notificationTapBackground);
//     await _pushPlugin
//         .resolvePlatformSpecificImplementation<
//             AndroidFlutterLocalNotificationsPlugin>()
//         ?.createNotificationChannel(channel);
//   }
//
//   static void onDidReceiveLocalNotification(
//       int id, String? title, String? body, String? payload) async {
//     // showDialog(
//     //   context: context,
//     //   builder: (BuildContext context) => CupertinoAlertDialog(
//     //     title: Text(title),
//     //     content: Text(body),
//     //     actions: [
//     //       CupertinoDialogAction(
//     //         isDefaultAction: true,
//     //         child: Text('Ok'),
//     //         onPressed: () async {
//     //           Navigator.of(context, rootNavigator: true).pop();
//     //           await Navigator.push(
//     //             context,
//     //             MaterialPageRoute(
//     //               builder: (context) => SecondScreen(payload),
//     //             ),
//     //           );
//     //         },
//     //       )
//     //     ],
//     //   ),
//     // )
//   }
//
//   @pragma('vm:entry-point')
//   static void notificationTapBackground(
//       NotificationResponse notificationResponse) {
//     // handle action
//   }
//
//   @pragma('vm:entry-point')
//   static void notificationResponse(NotificationResponse response) {}
//
//   static AndroidNotificationChannel channel = const AndroidNotificationChannel(
//     'high_importance_channel', // id
//     'High Importance Notifications', // title
//     description: 'This channel is used for important notifications.',
//     importance: Importance.high,
//   );
//
//   static Future<void> showNotificationWithAction(
//     String title,
//     String body,
//   ) async {
//     Location location = tz.getLocation(seoulTime);
//     tz.initializeTimeZone();
//     tz.setLocalLocation(location);
//     tz.TZDateTime now = tz.TZDateTime.now(location);
//     await _pushPlugin.zonedSchedule(
//         1, title, 'hey', tz.TZDateTime(now.location, now.year, now.minute), _details,
//         uiLocalNotificationDateInterpretation:
//         UILocalNotificationDateInterpretation.absoluteTime,
//         androidScheduleMode: AndroidScheduleMode.exact,
//         matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime);
//     // await _pushPlugin.show(0, title, body, _details);
//   }
//
//   static final NotificationDetails _details = NotificationDetails(
//       android: AndroidNotificationDetails(channel.id, channel.name,
//           actions: <AndroidNotificationAction>[],
//           icon: '@mipmap/ic_launcher',
//           channelDescription: channel.description,
//           importance: Importance.high,
//           color: primaryColor,
//           priority: Priority.high),
//       iOS: const DarwinNotificationDetails(
//         presentAlert: true,
//         presentBadge: true,
//         presentSound: true,
//       ));
//
//   static tz.TZDateTime? _timeSetting(TodoNotiTime todoNotiTime,
//       {TodoRepeat todoRepeat = TodoRepeat.noRepeat}) {
//     Location location = tz.getLocation(seoulTime);
//     tz.initializeTimeZone();
//     tz.setLocalLocation(location);
//     tz.TZDateTime _now = tz.TZDateTime.now(location);
//     switch (todoNotiTime) {
//       case TodoNotiTime.noTime:
//         return null;
//       case TodoNotiTime.minutes10Ago:
//         return  tz.TZDateTime(location, _now.year, _now.month, _now.day, _now.hour,
//             _now.minute - 30);
//       case TodoNotiTime.minutes30Ago:
//         return  tz.TZDateTime(location, _now.year, _now.month, _now.day, _now.hour,
//             _now.minute - 30);
//       case TodoNotiTime.minutes60Ago:
//         return  tz.TZDateTime(location, _now.year, _now.month, _now.day, _now.hour,
//             _now.minute - 30);
//     }
//   }
//   //       tz.TZDateTime.now(tz.local)
//   //             .withHour(time.hour)
//   //             .withMinute(time.minute)
//   //             .withSecond(time.second),
//
//   // static tz.TZDateTime _dateSetting(tz.TZDateTime time, TodoRepeat repeat) {
//   //   switch (repeat) {
//   //     case TodoRepeat.noRepeat:
//   //       return time;
//   //     case TodoRepeat.weekdays:
//   //       break;
//   //     case TodoRepeat.weekends:
//   //       break;
//   //     case TodoRepeat.dailys:
//   //       break;
//   //   }
//   // }
//
//   static void reserveTime(int pushId, String title, TodoNotiTime todoNotiTime,
//       {String? contents, TodoRepeat todoRepeat = TodoRepeat.noRepeat}) async {
//     Location location = tz.getLocation(seoulTime);
//     tz.initializeTimeZone();
//     tz.setLocalLocation(location);
//     DateTime now = DateTime.now();
//     await _pushPlugin.zonedSchedule(
//         pushId, title, contents ?? title, _timeSetting(todoNotiTime)!, _details,
//         uiLocalNotificationDateInterpretation:
//             UILocalNotificationDateInterpretation.absoluteTime,
//         androidScheduleMode: AndroidScheduleMode.exact,
//         matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime);
//     switch (todoRepeat) {
//       case TodoRepeat.noRepeat:
//         await _pushPlugin.zonedSchedule(
//             pushId, title, contents ?? title, _timeSetting(todoNotiTime)!, _details,
//             uiLocalNotificationDateInterpretation:
//             UILocalNotificationDateInterpretation.absoluteTime,
//             androidScheduleMode: AndroidScheduleMode.exact,
//             matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime);
//         return;
//       case TodoRepeat.weekdays:
//         await _pushPlugin.zonedSchedule(
//             pushId, title, contents ?? title, tz.TZDateTime.now(tz.local), _details,
//             uiLocalNotificationDateInterpretation:
//             UILocalNotificationDateInterpretation.absoluteTime,
//             androidScheduleMode: AndroidScheduleMode.exact,
//             matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime);
//         break;
//       case TodoRepeat.weekends:
//         // TODO: Handle this case.
//         break;
//       case TodoRepeat.dailys:
//         await _pushPlugin.periodicallyShow(
//           pushId,
//           title,
//           contents ?? title,
//           RepeatInterval.daily,
//           _details,
//           androidScheduleMode: AndroidScheduleMode.exact,
//         );
//         break;
//     }
//   }
//
// //await _localNotification.zonedSchedule(
// //       1,
// //       '로컬 푸시 알림 2',
// //       '특정 날짜 / 시간대 전송 알림',
// //       _timeZoneSetting(),
// //       _details,
// //       uiLocalNotificationDateInterpretation:
// //           UILocalNotificationDateInterpretation.absoluteTime,
// //       androidAllowWhileIdle: true,
// //     );
//
//   void clearAllPush() {
//     _pushPlugin.cancelAll();
//   }
// }
