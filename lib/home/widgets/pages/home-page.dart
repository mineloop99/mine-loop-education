import 'package:flutter/material.dart';

import '../pages/page-view-builder.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _homePage = Container(
    color: Colors.black12,
    height: 100,
    child: Center(
      child: Text('1', textScaleFactor: 5),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return PageViewBuilder(widget: _homePage);
  }
}
