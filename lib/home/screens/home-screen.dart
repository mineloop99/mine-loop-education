import 'package:flutter/material.dart';
import '../widgets/main-drawer.dart';
import '../widgets/my-sliver-appbar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      body: MySliverAppBar(),
    );
  }
}
