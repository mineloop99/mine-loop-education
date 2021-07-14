import 'package:flutter/material.dart';

import 'login-screen.dart';
import '../animation/page-route-transiction.dart';
import '../widgets/create-account-form.dart';

class CreateAccountScreen extends StatefulWidget {
  static const routeName = '/create-account';

  @override
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Text('Create new Account'),
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).push(fadedRoute(LoginScreen()));
            //.pushReplacementNamed(Routes.routeName[RouteNamesEnum.Login]);
          },
        ),
      ),
      body: CreateAccountForm(),
    );
  }
}
