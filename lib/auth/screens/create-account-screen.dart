import 'package:flutter/material.dart';
import '../../auth/screens/login_screen.dart';
import '../animation/page-route-transiction.dart';

import '../../models/routes.dart';

class CreateAccountScreen extends StatelessWidget {
  static const routeName = '/create-account';
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
      body: Center(
        child: Text('There\'s no item yet'),
      ),
    );
  }
}
