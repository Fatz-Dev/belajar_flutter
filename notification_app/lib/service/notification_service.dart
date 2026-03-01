class NotificationService {
  final  FlutterLocalNotificationsPlugin 
  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();


  Future<void> init() async {
    AndroidInitializationSettings andro = AndroidInitializationSettings('@mipmap/ic_launcher');

    DarwinInitializationSettings ios = DarwinInitializationSettings();

    InitializationSettings initialSetting = InitializationSettings(
     android: andro,
     IOS: aos, 
    )

  }

}