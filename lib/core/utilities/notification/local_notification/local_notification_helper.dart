import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'local_notification_controller.dart';

class LocalNotificationHelper {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  AndroidInitializationSettings get initializationSettingsAndroid => const AndroidInitializationSettings('mipmap/ic_launcher');
  DarwinInitializationSettings get initializationSettingsIOS => const DarwinInitializationSettings(requestAlertPermission: true,requestBadgePermission: false,requestSoundPermission: true,onDidReceiveLocalNotification: onTapNotification);
  InitializationSettings get initializationSettings => InitializationSettings(android: initializationSettingsAndroid,iOS: initializationSettingsIOS);
  AndroidNotificationDetails get androidPlatformChannelSpecifics =>const AndroidNotificationDetails('defaultChannelId', 'defaultChannelName',importance: Importance.max, priority: Priority.high, ticker: 'ticker');
  DarwinNotificationDetails get iOSPlatformChannelSpecifics => const DarwinNotificationDetails();
  NotificationDetails get platformChannelSpecifics =>  NotificationDetails(android: androidPlatformChannelSpecifics,iOS: iOSPlatformChannelSpecifics);
}
