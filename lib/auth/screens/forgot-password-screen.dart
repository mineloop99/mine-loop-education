import 'package:flutter/material.dart';
import '../widgets/forgot-password-widget.dart';

class ForgotPasswordScreen extends StatefulWidget {
  final Function navigator;
  const ForgotPasswordScreen({this.navigator});
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    final _deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: _deviceSize.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [0.0, 0.2, 0.9],
            colors: [
              const Color(0xFFc2e9fb),
              const Color(0xFFa3bded),
              const Color(0xFFc2e9fb),
            ],
          ),
          //color: Color.fromRGBO(240, 248, 255, 1),
        ),
        child: Center(
          child: ForgotPasswordWidget(widget.navigator),
        ),
      ),
    );
  }
}
