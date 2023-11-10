import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:monglee/app/config/moglee_color.dart';
import 'package:monglee/app/util/monglee_logger.dart';

@pragma('vm:entry-point')
class PushUtil {
  static final PushUtil _pushUtil = PushUtil._();

  PushUtil._();

  factory PushUtil() => _pushUtil;

  static final FlutterLocalNotificationsPlugin _pushPlugin =
      FlutterLocalNotificationsPlugin();

  static void initPush() async {
    AndroidInitializationSettings aosSettings =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    DarwinInitializationSettings iosSetting =
        const DarwinInitializationSettings(
            onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    await _pushPlugin.initialize(
        InitializationSettings(android: aosSettings, iOS: iosSetting),
        onDidReceiveNotificationResponse: notificationResponse,
        onDidReceiveBackgroundNotificationResponse: notificationTapBackground);
    await _pushPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  static void onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) async {
    // showDialog(
    //   context: context,
    //   builder: (BuildContext context) => CupertinoAlertDialog(
    //     title: Text(title),
    //     content: Text(body),
    //     actions: [
    //       CupertinoDialogAction(
    //         isDefaultAction: true,
    //         child: Text('Ok'),
    //         onPressed: () async {
    //           Navigator.of(context, rootNavigator: true).pop();
    //           await Navigator.push(
    //             context,
    //             MaterialPageRoute(
    //               builder: (context) => SecondScreen(payload),
    //             ),
    //           );
    //         },
    //       )
    //     ],
    //   ),
    // )
  }

  @pragma('vm:entry-point')
  static void notificationTapBackground(
      NotificationResponse notificationResponse) {
    // handle action
  }

  @pragma('vm:entry-point')
  static void notificationResponse(NotificationResponse response) {}

  static AndroidNotificationChannel channel = const AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description: 'This channel is used for important notifications.',
    // description
    importance: Importance.high,
  );

  static Future<void> showNotificationWithAction(
    String title,
    String body,
  ) async {
    await _pushPlugin
        .show(0, title, body, NotificationDetails(android: aosDetail, iOS: iosDetail));
    logger.e('hey!');
  }

  static AndroidNotificationDetails aosDetail = AndroidNotificationDetails(
      channel.id, channel.name,
      actions: <AndroidNotificationAction>[],
      icon: '@mipmap/ic_launcher',
      channelDescription: channel.description,
      importance: Importance.high,
      color: primaryColor,
      priority: Priority.high);
  static DarwinNotificationDetails iosDetail = DarwinNotificationDetails(
    presentAlert: true,
    presentBadge: true,
    presentSound: true,
  );

//  //Local Push
//   static Future<void> pushLocalPush(String songTitle, String language) async {
//     AndroidNotificationDetails android = AndroidNotificationDetails(
//         channel.id, channel.name,
//         channelDescription: channel.description,
//         icon: '@drawable/ic_notification');
//     late String content;
//     if (language == 'ko') {
//       content = '[$songTitle] 업로드 완료! 보컬 분석은 최대 2일이 소요됩니다. 정성을 다해 볼게요❤️';
//     } else {
//       content =
//           '[$songTitle] Uploaded! The analysis takes two days at maximum. I’ll try my best❤️️';
//     }
//     await flutterLocalNotificationsPlugin
//         .show(DateTime.now().microsecond, 'TUNEGEM', content,
//             NotificationDetails(android: android),
//             payload: HomeRoute.my.value)
//         .then((value) {});
//   }
//
//   static Future<void> pushFailLocalPush(
//       String songTitle, String language) async {
//     //ic_notification
//     AndroidNotificationDetails android = AndroidNotificationDetails(
//         channel.id, channel.name,
//         channelDescription: channel.description,
//         icon: '@drawable/ic_notification');
//     late String content;
//     if (language == 'ko') {
//       content = '[$songTitle] 업로드 실패. 다시 시도해 주세요 😢';
//     } else {
//       content = '[$songTitle] failed to upload. Try again 😢';
//     }
//     await flutterLocalNotificationsPlugin
//         .show(DateTime.now().microsecond, 'TUNEGEM', content,
//             NotificationDetails(android: android),
//             payload: '${HomeRoute.my.value}?pop_up=true')
//         .then((value) {});
//   }
}
