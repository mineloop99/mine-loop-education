import 'package:flutter/material.dart';
import 'package:mine_loop_education/grpc/authentication/authenticationpb/authentication.pbgrpc.dart';

import '../../grpc/authentication/client.dart';

class ChatScreen extends StatelessWidget {
  static const routeName = './chat';
  @override
  Widget build(BuildContext context) {
    AuthenticationAPI.instance.clientChatInit();
    return Scaffold(
      appBar: AppBar(
        title: Text('Yuu'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              AuthenticationAPI.instance.callLogin();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                AuthenticationAPI.instance.tryAutoLogin();
              },
            ),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                AuthenticationAPI.instance.createAccount();
              },
            ),
          ],
        ),
      ),
    );
  }
}
