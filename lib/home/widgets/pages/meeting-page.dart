import 'package:flutter/material.dart';

class MeetingPage extends StatefulWidget {

  @override
  _MeetingPageState createState() => _MeetingPageState();
}

class _MeetingPageState extends State<MeetingPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      height: 100,
      child: Center(
        child: Text('1', textScaleFactor: 5),
      ),
    );
  }
}
