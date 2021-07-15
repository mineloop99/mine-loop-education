import 'package:flutter/material.dart';

import '../../../home/screens/my-account-screens/change-password-screen.dart';
import '../../../home/screens/my-account-screens/edit-profile-screen.dart';
import '../../../home/screens/my-account-screens/link-account-screen.dart';

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
          child: Container(
            height: 80,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://i.pinimg.com/564x/aa/b1/2e/aab12e7cafcc79f2bf8f2f7c84bbc784.jpg'),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(
                    'https://i.pinimg.com/originals/09/88/4d/09884d0cb7ccb1bbd23ad16acdba3ffe.jpg'),
              ),
              title: Text(
                "Wanatabe Yuu",
                style: Theme.of(context).textTheme.headline6,
              ),
              subtitle: Text(
                "+84 969 132 923",
                style: Theme.of(context).textTheme.subtitle2,
              ),
              trailing: Icon(
                _animatedHeight == 0
                    ? Icons.arrow_downward_outlined
                    : Icons.arrow_upward_outlined,
                color: Colors.white,
              ),
              onTap: () {
                setState(() {
                  _animatedHeight == 0.0
                      ? _animatedHeight = _expandedHeight
                      : _animatedHeight = 0.0;
                });
              },
            ),
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
                    icon: Icons.person_outline_outlined,
                    text: 'Edit Profile',
                    ontap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) => EditProfileScreen(),
                        ),
                      );
                    },
                  ),
                  _accountCard(
                    icon: Icons.link_sharp,
                    text: 'Link Account',
                    ontap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) => LinkAccountScreen(),
                        ),
                      );
                    },
                  ),
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
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
