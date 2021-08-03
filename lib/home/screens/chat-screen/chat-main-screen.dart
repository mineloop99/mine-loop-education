import 'package:flutter/material.dart';
import '../../widgets/chat-widgets/chat-main-body-widget.dart';
import '../../widgets/chat-widgets/bottom-navigation-bar-widget.dart';

class ChatMainScreen extends StatefulWidget {
  static const routeName = './chat';
  @override
  _ChatMainScreenState createState() => _ChatMainScreenState();
}

class _ChatMainScreenState extends State<ChatMainScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
      ),
      body: ChatMainBodyWidget(),
      bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}
