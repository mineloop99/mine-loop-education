import 'package:flutter/material.dart';

class ErrorScreen extends StatefulWidget {
  static const routeName = './chat';

  @override
  _ErrorScreenState createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yuu'),
      ),
      body: Center(
        child: Text("Something Went Wrong"),
      ),
    );
  }
}
