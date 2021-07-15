import 'package:flutter/material.dart';

class NotificationsSettingScreen extends StatefulWidget {
  @override
  _NotificationsSettingScreenState createState() =>
      _NotificationsSettingScreenState();
}

class _NotificationsSettingScreenState
    extends State<NotificationsSettingScreen> {
  final listCountry = ["New Update", "New Course"];
  bool _generalNotification = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications Setting"),
      ),
      body: ListView.builder(
        itemCount: listCountry.length,
        itemBuilder: (ctx, i) => SwitchListTile(
          value: _generalNotification,
          title: Row(
            children: [
              Icon(
                _generalNotification
                    ? Icons.notifications_active
                    : Icons.notifications_off,
              ),
              const SizedBox(width: 5),
              Text(listCountry[i]),
            ],
          ),
          onChanged: (_) {
            setState(() {
              _generalNotification = !_generalNotification;
            });
          },
        ),
      ),
    );
  }
}
