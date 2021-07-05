import 'package:flutter/material.dart';
import 'auth_button.dart';

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
            onPressed: () {},
          ),
          Text('Or'),
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
