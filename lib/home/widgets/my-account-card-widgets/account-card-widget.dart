import 'package:flutter/material.dart';

import '../../../models/routes.dart';
import '../../../home/screens/my-account-screens/change-password-screen.dart';

class AccountCardWidget extends StatefulWidget {
  @override
  _AccountCardWidgetState createState() => _AccountCardWidgetState();
}

class _AccountCardWidgetState extends State<AccountCardWidget> {
  double _animatedHeight = 0;
  double _expandedHeight = 180;

  ///
  _accountCard({IconData icon, String text, Function ontap}) => ListTile(
        leading: Icon(
          icon,
          color: Theme.of(context).iconTheme.color,
        ),
        title: Text(text),
        trailing: Icon(Icons.arrow_right),
        onTap: ontap,
      );
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          margin: const EdgeInsets.all(8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: Colors.purple,
          child: ListTile(
            title: Text(
              "Wanatabe Yuu",
              style: Theme.of(context).textTheme.headline6,
            ),
            subtitle: Text(
              "+84 969 132 923",
              style: Theme.of(context).textTheme.subtitle2,
            ),
            leading: CircleAvatar(
              child: FittedBox(
                fit: BoxFit.cover,
                child: Icon(
                  Icons.account_circle_outlined,
                  size: 50,
                ),
              ),
            ),
            trailing: Icon(_animatedHeight == 0
                ? Icons.arrow_drop_down
                : Icons.arrow_drop_up),
            onTap: () {
              setState(() {
                _animatedHeight == 0.0
                    ? _animatedHeight = _expandedHeight
                    : _animatedHeight = 0.0;
              });
            },
          ),
        ),
        //// Expand Account Settings
        AnimatedContainer(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          duration: const Duration(milliseconds: 450),
          height: _animatedHeight,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 10,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _accountCard(
                    icon: Icons.lock_outline,
                    text: 'Change Password',
                    ontap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) => ChangePasswordScreen(),
                        ),
                      );
                    },
                  ),
                  _accountCard(
                    icon: Icons.language,
                    text: 'Change Region',
                    ontap: null,
                  ),
                  _accountCard(
                    icon: Icons.link_sharp,
                    text: 'Link Account',
                    ontap: null,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
