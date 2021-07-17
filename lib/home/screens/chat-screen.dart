import 'package:flutter/material.dart';
import 'package:mine_loop_education/grpc/authentication/authenticationpb/authentication.pbgrpc.dart';

import '../../grpc/authentication/client.dart';

class ChatScreen extends StatelessWidget {
  static const routeName = './chat';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yuu'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              AuthenticationAPI.instance.clientChatInit();
              AuthenticationAPI.instance.callLogin();
            },
          ),
        ],
      ),
      body: Center(
        child: IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            AuthenticationAPI.instance.tryAutoLogin();
          },
        ),
      ),
    );
  }
}
