abstract class  LocalNotificationManager{
  Future<void> init();
  Future<void> showNotification({required int id, required String title, required String body, required int seconds, String? payload});
  Future<void> scheduleNotification({required int id, required String title, required String body, required int seconds,required DateTime notificationTime});
  Future<void> cancelAllNotifications();
}