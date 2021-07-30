import 'package:flutter/material.dart';
import 'package:async/async.dart';

class Constants {
  static const double padding = 20;
  static const double avatarRadius = 45;
}

class NormalDialogPopup extends StatefulWidget {
  final Future<dynamic> methodCall;
  final Function methodCallWhenPressOk;
  final String customNavigatorString;
  final Function customNavigator;
  final bool twoTextButton;
  final String showSnackBarMessage;
  final BuildContext contextSnackBarMessage;
  const NormalDialogPopup(
      {@required this.methodCall,
      @required this.methodCallWhenPressOk,
      this.customNavigator,
      this.customNavigatorString,
      this.twoTextButton = true,
      this.showSnackBarMessage = "",
      this.contextSnackBarMessage});

  @override
  _NormalDialogPopupState createState() => _NormalDialogPopupState();
}

class _NormalDialogPopupState extends State<NormalDialogPopup> {
  AsyncMemoizer<String> _asyncMemoizer;
  Future<String> _futureWatting() async {
    return this._asyncMemoizer.runOnce(() async {
      final respone = await widget.methodCall;
      return respone;
    });
  }

  _dialog(BuildContext context,
          {bool errorPop, String title, String description}) =>
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
                        widget.methodCallWhenPressOk();
                        widget.customNavigator();
                      },
                      child: const Text(
                        "OK",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
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

  @override
  void initState() {
    _asyncMemoizer = AsyncMemoizer();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
        future: _futureWatting(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            if (snapshot.data == "OK") {
              Navigator.of(context).pop();
              if (widget.showSnackBarMessage.isNotEmpty) {
                Future.delayed(
                    Duration(milliseconds: 500),
                    () =>
                        ScaffoldMessenger.maybeOf(widget.contextSnackBarMessage)
                            .showSnackBar(SnackBar(
                          content: Text(widget.showSnackBarMessage),
                        )));
              }
            } else if (snapshot.data == widget.customNavigatorString) {
              return _dialog(context,
                  errorPop: false,
                  title: "SUCCEED!",
                  description: snapshot.data);
            } else {
              return _dialog(
                context,
                errorPop: true,
                title: "An error Occured!",
                description: snapshot.data,
              );
            }
          }
          return SizedBox();
        });
  }
}
