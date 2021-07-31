import 'package:flutter/material.dart';

import 'home-page/home-page-app-bar.dart';

class ClassPage extends StatefulWidget {
  @override
  _ClassPageState createState() => _ClassPageState();
}

class _ClassPageState extends State<ClassPage> {
  Widget _classPage = Container(
    color: Colors.black12,
    height: 100,
    child: Center(
      child: const Text('2', textScaleFactor: 5),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return PageViewBuilder(widget: _classPage);
  }
}
