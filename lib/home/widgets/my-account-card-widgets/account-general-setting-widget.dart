import 'package:flutter/material.dart';

import './general-setting-button.dart';
import '../../screens/my-account-screens/notifications-setting-screen.dart';
import '../../screens/my-account-screens/language-setting-screen.dart';
import '../../screens/my-account-screens/help-support-screen.dart';

class AccountGeneralSettingWidget extends StatefulWidget {
  @override
  _AccountGeneralSettingWidgetState createState() =>
      _AccountGeneralSettingWidgetState();
}

class _AccountGeneralSettingWidgetState
    extends State<AccountGeneralSettingWidget> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> _generalButtonList = [
      GeneralSettingButton(
        title: "Notifications",
        subTitle: "News Course, App Updates",
        imageLeading: Icon(Icons.account_circle_outlined, size: 50),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => NotificationsSettingScreen(),
            ),
          );
        },
      ),
      GeneralSettingButton(
        title: "Language",
        subTitle: "Change Application Language",
        imageLeading: Icon(Icons.language_outlined, size: 50),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => LanguageSettingScreen(),
            ),
          );
        },
      ),
      GeneralSettingButton(
        title: "Help & Support",
        subTitle: "FAQ & Help center",
        imageLeading: Icon(Icons.help_outline_outlined, size: 50),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => HelpSupportScreen(),
            ),
          );
        },
      ),
      GeneralSettingButton(
        title: "Log Out",
        subTitle: "Return to Login Screen",
        imageLeading: Icon(Icons.logout, size: 30),
        onTap: () {},
      ),
    ];
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              'General',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: _generalButtonList,
            ),
          )
        ],
      ),
    );
  }
}
