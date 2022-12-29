// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'local_notification_helper.dart';
import 'local_notification_manager.dart';


class LocalNotificationController extends LocalNotificationHelper implements LocalNotificationManager{
  static final LocalNotificationController _notificationService = LocalNotificationController._internal();
  factory LocalNotificationController() => _notificationService;
  LocalNotificationController._internal();

  @override
  Future<void> init() async {
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  /// ```dart
  ///Send Local Notificaiton
  ///
  ///EXAMPLE
  ///
  /// LocalNotificationController().showNotification(
  ///  body: 'BODY',
  ///  id: 0,
  ///  title: 'TİTLE', 
  ///  seconds: 3,
  /// );
  ///
  ///
  ///
  /// ```
  @override
  Future<void> showNotification({required int id, required String title, required String body, required int seconds, String? payload}) async {
    await flutterLocalNotificationsPlugin.show(id, title, body, platformChannelSpecifics, payload: payload);
  }

  @override
  Future<void> scheduleNotification({required int id, required String title, required String body, required int seconds,required DateTime notificationTime}) async {
    tz.initializeTimeZones();
    Duration offsetTime= DateTime.now().timeZoneOffset;
    tz.TZDateTime zonedTime = tz.TZDateTime.local(notificationTime.year,notificationTime.month,notificationTime.day,notificationTime.hour,notificationTime.minute,notificationTime.second).subtract(offsetTime);
    
    return await flutterLocalNotificationsPlugin.zonedSchedule(
    id, title, body,zonedTime,platformChannelSpecifics, androidAllowWhileIdle: true,uiLocalNotificationDateInterpretation:UILocalNotificationDateInterpretation.absoluteTime);
  }


  @override
  Future<void> cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }
  

  
}

  @override
Future<void> onTapNotification(int id,String? title, String? body, String? payload) {
    // ignore: todo
    // TODO: Notification On Click Event
    throw UnimplementedError();
}




