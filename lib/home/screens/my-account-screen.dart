import 'package:flutter/material.dart';

import '../widgets/my-account-card-widgets/account-card-widget.dart';
import '../widgets/my-account-card-widgets/account-general-setting-widget.dart';
import '../widgets/my-account-card-widgets/dark-screen-mode-button.dart';

class MyAccountScreen extends StatelessWidget {
  static const routeName = './my-account';
  const MyAccountScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Theme.of(context).appBarTheme.color,
        title: Text('My Account'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AccountCardWidget(),
            DarkScreenModeButton(),
            SizedBox(height: 20),
            ///// General
            AccountGeneralSettingWidget(),
          ],
        ),
      ),
    );
  }
}
