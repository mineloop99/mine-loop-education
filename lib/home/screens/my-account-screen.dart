import 'package:flutter/material.dart';

class MyAccountScreen extends StatelessWidget {
  static const routeName = './my-account';
  const MyAccountScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Account'),
      ),
      body: Center(
        child: Text('This\'s my account screen'),
      ),
    );
  }
}
