import 'package:flutter/material.dart';

class MyCourseScreen extends StatefulWidget {
  static const routeName = './my-course';
  @override
  _MyCourseScreenState createState() => _MyCourseScreenState();
}

class _MyCourseScreenState extends State<MyCourseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Course'),
      ),
      body: Center(
        child: Text('There\'s no course yet'),
      ),
    );
  }
}
