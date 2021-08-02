import 'package:flutter/material.dart';

class ChatBodyScreen extends StatefulWidget {
  @override
  _ChatBodyScreenState createState() => _ChatBodyScreenState();
}

class _ChatBodyScreenState extends State<ChatBodyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Center(
        child: Text("Chat"),
      )),
    );
  }
}
