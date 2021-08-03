import 'package:flutter/material.dart';

class ChatMainCardWidget extends StatefulWidget {
  final String friendName;
  final String message;
  final String circleAvatarUri;
  final String id;
  const ChatMainCardWidget({
    @required this.friendName,
    @required this.message,
    @required this.circleAvatarUri,
    @required this.id,
  });
  @override
  _ChatMainCardWidgetState createState() => _ChatMainCardWidgetState();
}

class _ChatMainCardWidgetState extends State<ChatMainCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        leading: CircleAvatar(
          child: const Icon(Icons.person),
        ),
        title: Text(
          widget.friendName,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(widget.message),
      ),
    );
  }
}
