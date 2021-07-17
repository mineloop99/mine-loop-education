import 'package:flutter/material.dart';
import 'auth-button.dart';
import '../screens/create-account-screen.dart';
import '../animation/page-route-transiction.dart';

class CreateFromWidget extends StatelessWidget {
  const CreateFromWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton(
            child: Text(
              'Create an new Account now',
              style: TextStyle(
                color: Colors.blue,
                fontStyle: FontStyle.italic,
              ),
            ),
            onPressed: () {
              Navigator.of(context).push(createRoute(CreateAccountScreen()));
            },
          ),
          const Text('Or'),
          AuthButton(
            path: 'assets/images/google_signin_logo.png',
            textButton: 'Sign up with Google',
            onPressed: () {},
            isNotElevatedButtonIcon: false,
          ),
        ],
      ),
    );
  }
}
