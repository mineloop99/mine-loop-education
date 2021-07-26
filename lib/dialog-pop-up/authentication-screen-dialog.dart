import 'package:flutter/material.dart';

import '../models/routes.dart';
import '../auth/screens/verify-account-screen.dart';

class Constants {
  static const double padding = 20;
  static const double avatarRadius = 45;
}

class AuthenticationScreenDialog extends StatefulWidget {
  final Future<dynamic> methodCall;
  final bool isLoginMethod;
  AuthenticationScreenDialog({
    @required this.methodCall,
    this.isLoginMethod = false,
  });

  @override
  _AuthenticationScreenDialogState createState() =>
      _AuthenticationScreenDialogState();
}

class _AuthenticationScreenDialogState
    extends State<AuthenticationScreenDialog> {
  ////General Dialog
  _dialog(
    BuildContext context, {
    String title,
    String description,
    bool errorPop,
  }) =>
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Constants.padding),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                  left: Constants.padding,
                  top: Constants.avatarRadius + Constants.padding,
                  right: Constants.padding,
                  bottom: Constants.padding),
              margin: EdgeInsets.only(top: Constants.avatarRadius),
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Constants.padding),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black,
                        offset: Offset(0, 10),
                        blurRadius: 10),
                  ]),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: errorPop
                            ? Theme.of(context).errorColor
                            : Colors.green),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    description,
                    style: const TextStyle(fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          if (errorPop) return null;
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (ctx) => VerifyAccountScreen(
                                navigatorFunction: () => Future.delayed(
                                    Duration(milliseconds: 500),
                                    () => Navigator.of(ctx)
                                        .pushNamedAndRemoveUntil(
                                            Routes
                                                .routeName[RouteNamesEnum.Home],
                                            (Route<dynamic> route) => false)),
                                isChangePassword: false,
                              ),
                            ),
                          );
                        },
                        child: const Text(
                          "OK",
                          style: TextStyle(fontSize: 18),
                        )),
                  ),
                ],
              ),
            ), // bottom part
            //Circle Icon
            Positioned(
              left: Constants.padding,
              right: Constants.padding,
              child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: Constants.avatarRadius,
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(
                          const Radius.circular(Constants.avatarRadius)),
                      child: Image.network(
                          "https://i.pinimg.com/originals/09/88/4d/09884d0cb7ccb1bbd23ad16acdba3ffe.jpg"))), // top part
            )
          ],
        ),
      );

  //// Login if is login method and call create if create account method
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
        future: widget.methodCall,
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            if (snapshot.data == "OK") {
              // Navigator to Home if Login method succeed.//
              if (widget.isLoginMethod) {
                Future.delayed(Duration(seconds: 1), () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      Routes.routeName[RouteNamesEnum.Home],
                      (Route<dynamic> route) => false);
                });
              } else {
                return _dialog(context,
                    title: "Create Account Succeed",
                    description: "Confirm email now to continue",
                    errorPop: false);
              }
            } else if (snapshot.data.contains('@')) {
              return _dialog(context,
                  title: "Login Succeed",
                  description: "You need verify to continue",
                  errorPop: false);
            } else {
              return _dialog(context,
                  title: "An error Occured!",
                  description: snapshot.data,
                  errorPop: true);
            }
          }
          return SizedBox();
        });
  }
}
