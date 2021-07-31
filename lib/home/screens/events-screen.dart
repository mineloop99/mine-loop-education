import 'package:flutter/material.dart';

class EventsScreen extends StatefulWidget {
  static const routeName = './menu';
  @override
  _EventsScreenState createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Events'),
      ),
      body: Center(
        child: Text('There\'s no event at this moment'),
      ),
    );
  }
}
