import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String path;
  final String textButton;
  final Function onPressed;
  final bool isNotElevatedButtonIcon;
  const AuthButton(
      {Key key,
      this.path,
      @required this.onPressed,
      @required this.textButton,
      @required this.isNotElevatedButtonIcon})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (path != null || !isNotElevatedButtonIcon)
              Container(
                padding: const EdgeInsets.all(5.0),
                child: Image(
                  image: AssetImage(path),
                  height: 25,
                  width: 25,
                ),
              ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(left: 5.0, right: 5.0),
              child: Text(
                textButton,
                style: !isNotElevatedButtonIcon
                    ? TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      )
                    : TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
              ),
            ),
          ],
        ),
      ),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(1.0),
        primary: const Color(0xff4285F4),
      ),
      onPressed: onPressed,
    );
  }
}
