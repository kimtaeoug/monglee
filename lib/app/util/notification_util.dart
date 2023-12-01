import 'dart:isolate';
import 'dart:ui';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monglee/app/extensions/styler.dart';
import 'package:monglee/app/extensions/todo_noti_time.dart';
import 'package:monglee/app/extensions/todo_repeat.dart';
import 'package:monglee/main.dart';

class NotificationUtil {
  static const String CHANNEL_KEY = 'MongleeChannelKey';
  static const String CHANNEL_NAME = 'MongleeChannel';
  static final AwesomeNotifications _noti = AwesomeNotifications();
  static final NotificationChannel _channel = NotificationChannel(
      channelKey: CHANNEL_KEY,
      channelName: CHANNEL_NAME,
      channelDescription: 'Notification for Monglee',
      playSound: true,
      onlyAlertOnce: true,
      groupAlertBehavior: GroupAlertBehavior.Children,
      importance: NotificationImportance.High,
      defaultPrivacy: NotificationPrivacy.Private,
      defaultColor: Colors.deepPurple,
      ledColor: Colors.deepPurple);

  static ReceivedAction? initialAction;

  static Future<void> initializeLocalNotifications() async {
    await _noti.initialize(
        null, //'resource://drawable/res_app_icon',//
        [_channel],
        debug: true);

    // Get initial notification action is optional
    initialAction =
        await _noti.getInitialNotificationAction(removeFromActionEvents: false);
    _noti.setLocalization(languageCode: 'ko-kr');
  }

  static ReceivePort? receivePort;

  static Future<void> initializeIsolateReceivePort() async {
    receivePort = ReceivePort('Notification action port in main isolate')
      ..listen(
          (silentData) => onActionReceivedImplementationMethod(silentData));
    IsolateNameServer.registerPortWithName(
        receivePort!.sendPort, 'notification_action_port');
  }

  static Future<void> startListeningNotificationEvents() async {
    _noti.setListeners(onActionReceivedMethod: onActionReceivedMethod);
  }

  @pragma('vm:entry-point')
  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {
    if (receivedAction.actionType == ActionType.SilentAction ||
        receivedAction.actionType == ActionType.SilentBackgroundAction) {
      // For background actions, you must hold the execution until the end
      print(
          'Message sent via notification input: "${receivedAction.buttonKeyInput}"');
      await executeLongTaskInBackground();
    } else {
      // this process is only necessary when you need to redirect the user
      // to a new page or use a valid context, since parallel isolates do not
      // have valid context, so you need redirect the execution to main isolate
      if (receivePort == null) {
        print(
            'onActionReceivedMethod was called inside a parallel dart isolate.');
        SendPort? sendPort =
            IsolateNameServer.lookupPortByName('notification_action_port');

        if (sendPort != null) {
          print('Redirecting the execution to main isolate process.');
          sendPort.send(receivedAction);
          return;
        }
      }

      return onActionReceivedImplementationMethod(receivedAction);
    }
  }

  static Future<void> onActionReceivedImplementationMethod(
      ReceivedAction receivedAction) async {
    // MyApp.navigatorKey.currentState?.pushNamedAndRemoveUntil(
    //     '/notification-page',
    //         (route) =>
    //     (route.settings.name != '/notification-page') || route.isFirst,
    //     arguments: receivedAction);
  }

  static Future<bool> requestPermission() async {
    return await AwesomeNotifications().requestPermissionToSendNotifications();
  }
  static Future<void> displayNotificationRationale(
      Function() function, Function() failFunction) async {
    bool isAllowed = await _noti.isNotificationAllowed();
    if (!isAllowed) {
      await Get.dialog(AlertDialog(
        title: Text('알림 권한',
            style: Styler.style(fontSize: 16, fontWeight: FontWeight.w700)),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 15,
              height: 15,
              child: Image.asset('assets/images/cotton_3.png'),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              '할 일 알림을 위해 권한이 필요합니다.',
              style: Styler.style(fontWeight: FontWeight.w600),
            )
          ],
        ),
        actions: [
          TextButton(
              onPressed: () {
                Get.back();
                function.call();
                failFunction.call();
              },
              child: Text(
                'Deny',
                style: Styler.style(
                    fontWeight: FontWeight.w300, color: Colors.red),
              )),
          TextButton(
              onPressed: () async {
                await AwesomeNotifications()
                    .requestPermissionToSendNotifications()
                    .then((value) {
                  Get.back();
                  function.call();
                  if (!value) {
                    failFunction.call();
                  }
                });
              },
              child: Text(
                'Allow',
                style: Styler.style(
                    fontWeight: FontWeight.w700, color: Colors.blue),
              )),
        ],
      ));
    } else {
      function.call();
    }
  }

  ///  *********************************************
  ///     BACKGROUND TASKS TEST
  ///  *********************************************
  static Future<void> executeLongTaskInBackground() async {
    // print("starting long task");
    // await Future.delayed(const Duration(seconds: 4));
    // final url = Uri.parse("http://google.com");
    // final re = await http.get(url);
    // print(re.body);
    // print("long task done");
  }

  static Future<void> createNewNotification(
    String title,
    String body,
  ) async {
    bool isAllowed = await _noti.isNotificationAllowed();
    if (!isAllowed) isAllowed = await requestPermission();
    if (!isAllowed) return;

    await _noti.createNotification(
        content: NotificationContent(
            id: -1,
            // -1 is replaced by a random number
            channelKey: 'alerts',
            title: 'Huston! The eagle has landed!',
            body:
                "A small step for a man, but a giant leap to Flutter's community!",
            bigPicture: 'https://storage.googleapis.com/cms-storage-bucket/d406c736e7c4c57f5f61.png',
            // largeIcon: 'https://storage.googleapis.com/cms-storage-bucket/0dbfcc7a59cd1cf16282.png',
            //'asset://assets/images/balloons-in-sky.jpg',
            notificationLayout: NotificationLayout.BigPicture,
            payload: {'notificationId': '1234567890'}),
        actionButtons: [
          NotificationActionButton(key: 'REDIRECT', label: 'Redirect'),
          NotificationActionButton(
              key: 'REPLY',
              label: 'Reply Message',
              requireInputText: true,
              actionType: ActionType.SilentAction),
          NotificationActionButton(
              key: 'DISMISS',
              label: '나중에',
              actionType: ActionType.DismissAction,
              isDangerousOption: true)
        ]);
  }

  static Future<void> scheduleNewNotification() async {
    bool isAllowed = await _noti.isNotificationAllowed();
    if (!isAllowed) isAllowed = await requestPermission();
    if (!isAllowed) return;

    await myNotifyScheduleInHours(
        title: 'test',
        msg: 'test message',
        heroThumbUrl:
            'https://storage.googleapis.com/cms-storage-bucket/d406c736e7c4c57f5f61.png',
        hoursFromNow: 5,
        username: 'test user',
        repeatNotif: false);
  }

  static Future<void> resetBadgeCounter() async {
    await _noti.resetGlobalBadge();
  }

  static Future<void> cancelNotifications() async {
    await _noti.cancelAll();
  }

  static int _convertMinute(int minute, TodoNotiTime notiTime) {
    switch (notiTime) {
      case TodoNotiTime.noTime:
        return minute;
      case TodoNotiTime.minutes10Ago:
        return minute - 10;
      case TodoNotiTime.minutes30Ago:
        return minute - 30;
      case TodoNotiTime.minutes60Ago:
        return minute - 60;
    }
  }

  static const int _interval = 60;

  static int? _convertingInterval(TodoRepeat repeat) {
    switch (repeat) {
      case TodoRepeat.noRepeat:
        return null;
      case TodoRepeat.minute5:
        return _interval;
      case TodoRepeat.minute10:
        return _interval * 2;
      case TodoRepeat.minute30:
        return _interval * 6;
      case TodoRepeat.minute60:
        return _interval * 12;
    }
  }

  //NotificationCalendar(
  //         repeatInterval: RepeatInterval.daily,
  //         timeZone: 'UTC', // 시간대 설정
  //         hour: 10, // 알림을 보낼 시간 (24시간 형식)
  //         minute: 0, // 알림을 보낼 분
  //       ),

  static Future<void> schedulingNotification( DateTime selectedTime,
      String title, String body, TodoNotiTime notiTime,
      {TodoRepeat todoRepeat = TodoRepeat.noRepeat,
      Map<String, String>? payLoad}) async {
    // String localTimeZone = await _noti.getLocalTimeZoneIdentifier();
    // DateTime time = DateTime.now();
    await _noti.createNotification(
        schedule: todoRepeat != TodoRepeat.noRepeat
            ? NotificationCalendar(
            year: selectedTime.year,
            month: selectedTime.month,
            day: selectedTime.day,
            hour: selectedTime.hour,
            minute: _convertMinute(selectedTime.minute, notiTime),
            // interval: _convertingInterval(todoRepeat),
            // timeZone: localTimeZone,
            allowWhileIdle: true,
            repeats: true)
        // ? NotificationCalendar(
            // year: selectedTime.year,
            // month: selectedTime.month,
            // day: selectedTime.day,
            // hour: selectedTime.hour,
            // minute: _convertMinute(selectedTime.minute, notiTime),
            // // interval: _convertingInterval(todoRepeat),
            // // timeZone: localTimeZone,
            // allowWhileIdle: true,
            // repeats: true)
            : null,
        // schedule: todoRepeat != TodoRepeat.noRepeat
        //     ? NotificationInterval(
        //         interval: _convertingInterval(todoRepeat),
        //         timeZone: localTimeZone,
        //         allowWhileIdle: true,
        //         repeats: true)
        //     : null,
        content: NotificationContent(
            id: -1,
            channelKey: CHANNEL_KEY,
            title: title,
            body: body,
            // notificationLayout: NotificationLayout.BigPicture,
            //actionType : ActionType.DismissAction,
            color: Colors.black,
            backgroundColor: Colors.black,
            payload: payLoad
            // customSound: 'resource://raw/notif',
            ));
  }
}

Future<void> myNotifyScheduleInHours({
  required int hoursFromNow,
  required String heroThumbUrl,
  required String username,
  required String title,
  required String msg,
  bool repeatNotif = false,
}) async {
  var nowDate = DateTime.now().add(Duration(hours: hoursFromNow, seconds: 5));
  await AwesomeNotifications().createNotification(
    schedule: NotificationCalendar(
      //weekday: nowDate.day,
      hour: nowDate.hour,
      minute: 0,
      second: nowDate.second,
      repeats: repeatNotif,
      //allowWhileIdle: true,
    ),
    // schedule: NotificationCalendar.fromDate(
    //    date: DateTime.now().add(const Duration(seconds: 10))),
    content: NotificationContent(
      id: -1,
      channelKey: 'basic_channel',
      title: '${Emojis.food_bowl_with_spoon} $title',
      body: '$username, $msg',
      bigPicture: heroThumbUrl,
      notificationLayout: NotificationLayout.BigPicture,
      //actionType : ActionType.DismissAction,
      color: Colors.black,
      backgroundColor: Colors.black,
      // customSound: 'resource://raw/notif',
      payload: {'actPag': 'myAct', 'actType': 'food', 'username': username},
    ),
    actionButtons: [
      NotificationActionButton(
        key: 'NOW',
        label: 'btnAct1',
      ),
      NotificationActionButton(
        key: 'LATER',
        label: 'btnAct2',
      ),
    ],
  );
}
