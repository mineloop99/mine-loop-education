import 'package:flutter/material.dart';

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
      appBar: AppBar(
        title: Text('Yuu'),
      ),
      body: Center(
        child: IconButton(
          icon: Icon(Icons.add),
          onPressed: () {},
        ),
      ),
    );
  }
}
