import 'package:flutter/material.dart';
import 'package:mine_loop_education/home/screens/chat-screen/chat-body-screen.dart';
import '../../grpc/authentication/client.dart';

class ChatScreen extends StatefulWidget {
  static const routeName = './chat';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    super.initState();
    AuthenticationAPI.instance.clientAuthInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChatBodyScreen(),
      bottomNavigationBar: BottomNavigationBar(
        items: [],
      ),
    );
  }
}
