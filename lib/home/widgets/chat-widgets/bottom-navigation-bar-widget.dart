import 'package:flutter/material.dart';

class ChatWidget extends StatefulWidget {
  final String name;
  const ChatWidget({this.name = "name"});
  @override
  _ChatWidgetState createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Icon(Icons.help_outline),
      ),
      title: Text(widget.name),
    );
  }
}
