import 'package:flutter/material.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  final String label;
  final IconData iconData;
  const BottomNavigationBarWidget(
      {this.label = "name", this.iconData = Icons.home});
  @override
  _BottomNavigationBarWidgetState createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: (value) {
        setState(() {
          selectedIndex = value;
        });
      },
      items: [
        BottomNavigationBarItem(label: 'Hello', icon: Icon(Icons.edit)),
        BottomNavigationBarItem(label: 'Hello', icon: Icon(Icons.home))
      ],
    );
  }
}
