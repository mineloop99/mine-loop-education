import 'package:flutter/material.dart';

class EventsPage extends StatefulWidget {
  static const routeName = './search';
  const EventsPage({Key key}) : super(key: key);

  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
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
