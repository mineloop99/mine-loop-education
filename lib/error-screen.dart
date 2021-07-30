import 'package:flutter/material.dart';

class ErrorScreen extends StatefulWidget {
  static const routeName = './chat';

  @override
  _ErrorScreenState createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Something Went Wrong"),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Back'))
            ],
          ),
        ),
      ),
    );
  }
}
