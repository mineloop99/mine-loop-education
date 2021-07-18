import 'package:flutter/material.dart';

import '../../../grpc/authentication/client.dart';

class Constants {
  static const double padding = 20;
  static const double avatarRadius = 45;
}

enum TypeOfDialog {
  ErrorDialog,
  SucceedDialog,
}

class AuthenticationScreenDialog extends StatelessWidget {
  final Future<dynamic> methodCall;
  AuthenticationScreenDialog({@required this.methodCall});

  ////General Dialog
  _errorDialog(BuildContext context, String title, String description,
          TypeOfDialog typeOfDialog) =>
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
                        color: typeOfDialog == TypeOfDialog.ErrorDialog
                            ? Theme.of(context).errorColor
                            : Theme.of(context).textTheme),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    description,
                    style: TextStyle(fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "OK",
                          style: TextStyle(fontSize: 18),
                        )),
                  ),
                ],
              ),
            ), // bottom part
            Positioned(
              left: Constants.padding,
              right: Constants.padding,
              child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: Constants.avatarRadius,
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(
                          Radius.circular(Constants.avatarRadius)),
                      child: Image.network(
                          "https://i.pinimg.com/originals/09/88/4d/09884d0cb7ccb1bbd23ad16acdba3ffe.jpg"))), // top part
            )
          ],
        ),
      );
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: methodCall,
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return IgnorePointer(
                child: Center(child: CircularProgressIndicator()));
          else if (snapshot.hasData) {
            if (snapshot.data == "OK") {
              Navigator.of(context).pop();
            } else {
              return _errorDialog(context, "error occurred during progress",
                  snapshot.data, TypeOfDialog.ErrorDialog);
            }
          }
          return SizedBox();
        });
  }
}
