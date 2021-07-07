import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  static const routeName = './menu';
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
      ),
      body: Center(
        child: Text('There\'s no item yet'),
      ),
    );
  }
}
