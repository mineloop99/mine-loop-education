import 'package:flutter/material.dart';
import '../../widgets/chat-widgets/chat-main-body-widget.dart';
import '../../widgets/chat-widgets/bottom-navigation-bar-widget.dart';

class ChatWithFriendScreen extends StatefulWidget {
  final String friendName;
  const ChatWithFriendScreen({@required this.friendName});
  @override
  _ChatWithFriendScreenState createState() => _ChatWithFriendScreenState();
}

class _ChatWithFriendScreenState extends State<ChatWithFriendScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.friendName),
        ),
        body: Center(
          child: Text('Hello'),
        ));
  }
}
