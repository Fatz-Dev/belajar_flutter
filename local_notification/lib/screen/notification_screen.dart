import 'package:flutter/material.dart';
import 'package:local_notification/services/notification_service.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  
  final NotificationService ns = NotificationService();

  Future<void> _showNotification() async {
    await ns.showNotification(
      id: 1,
      title: 'Notifikasi Lokal',
      description: 'Ini adalah notifikasi lokal',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(' Latihan notifikasi')),
      body: Column(
        children: [
          FilledButton(onPressed: _showNotification, child: Text('Notifikasi Lokal')),
        ],
      ),
    );
  }
}
