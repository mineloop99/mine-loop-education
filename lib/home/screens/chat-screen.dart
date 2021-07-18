import 'package:flutter/material.dart';

import '../../grpc/authentication/client.dart';
import '../widgets/dialog-pop-up/authentication-screen-dialog.dart';

class ChatScreen extends StatefulWidget {
  static const routeName = './chat';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    super.initState();
    AuthenticationAPI.instance.clientChatInit();
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
          onPressed: () {
            showDialog(
                context: context,
                builder: (_) {
                  return AuthenticationScreenDialog(
                    methodCall: AuthenticationAPI.instance.callLogin("1", "2"),
                  );
                });
          },
        ),
      ),
    );
  }
}
