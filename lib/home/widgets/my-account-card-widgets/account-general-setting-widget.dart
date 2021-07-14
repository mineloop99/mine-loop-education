import 'package:flutter/material.dart';

import './general-setting-button.dart';

class AccountGeneralSettingWidget extends StatefulWidget {
  @override
  _AccountGeneralSettingWidgetState createState() =>
      _AccountGeneralSettingWidgetState();
}

class _AccountGeneralSettingWidgetState
    extends State<AccountGeneralSettingWidget> {
  final List<Widget> _generalButtonList = [
    GeneralSettingButton(
      title: "Notifications",
      subTitle: "News Course, App Updates",
      imageLeading: Icon(Icons.account_circle_outlined, size: 50),
      onTap: () {},
    ),
    GeneralSettingButton(
      title: "Language",
      subTitle: "Change Application Language",
      imageLeading: Icon(Icons.language_outlined, size: 50),
      onTap: () {},
    ),
    GeneralSettingButton(
      title: "Help & Support",
      subTitle: "FAQ & Help center",
      imageLeading: Icon(Icons.help_outline_outlined, size: 50),
      onTap: () {},
    ),
    GeneralSettingButton(
      title: "Log Out",
      subTitle: "",
      imageLeading: Icon(Icons.logout, size: 30),
      onTap: () {},
    ),
  ];

  @override
  Widget build(BuildContext context) {
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
