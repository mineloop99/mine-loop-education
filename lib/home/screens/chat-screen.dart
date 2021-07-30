import 'package:flutter/material.dart';
import '../../grpc/account-information/account-information-client.dart';
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
          onPressed: () {
            AccountInformationAPI.instance.callEditAccountInformation(
                userBirthday: DateTime.now(),
                userPhoneNumber: "21492194",
                userSex: "213215412",
                username: "1235135412");
          },
        ),
      ),
    );
  }
}
