import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    // initialize setting
    // is Android
    AndroidInitializationSettings andro = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );

    // is IOS
    DarwinInitializationSettings ios = DarwinInitializationSettings();

    InitializationSettings initialSetting = InitializationSettings(
      android: andro,
      iOS: ios,
    );

    await flutterLocalNotificationsPlugin.initialize(initialSetting);

    // Request Permission iOS
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin
        >()
        ?.requestPermissions(alert: true, badge: true, sound: true);

    // Request Permissin Android
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.requestNotificationsPermission();
  }

  Future<void> showNotification({
    required int id,
    required String title,
    required String description,
  }) async {
    final AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
          'channel_id',
          'channel Name',
          channelDescription: 'channel untuk notifikasi lokal',
          importance: Importance.max,
          priority: Priority.high,
        );

    final DarwinNotificationDetails darwinNotificationDetails =
        DarwinNotificationDetails();

    final NotificationDetails nd = NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNotificationDetails,
    );

    await flutterLocalNotificationsPlugin.show(
      id,
      title,
      description,
      nd,
    );
  }
}
