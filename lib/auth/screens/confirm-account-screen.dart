import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mine_loop_education/auth/widgets/auth-button.dart';

class ConfirmAccountScreen extends StatefulWidget {
  _ConfirmAccountScreenState createState() => _ConfirmAccountScreenState();
}

class _ConfirmAccountScreenState extends State<ConfirmAccountScreen> {
  String _numberConfirmed = '000000';
  String _numberSupport = '000000';
  final List<FocusNode> focusNodes = List<FocusNode>.generate(6, (index) {
    return FocusNode();
  });
  final List<TextEditingController> textControllers =
      List<TextEditingController>.generate(6, (index) {
    return TextEditingController();
  });

  static const maxSeconds = 10;
  int _seconds = maxSeconds;
  Timer timer;

  bool _canResend = false;

  void _setTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (_seconds > 0)
        setState(() {
          _seconds--;
        });
      else {
        setState(() {
          timer.cancel();
          _canResend = true;
        });
      }
    });
  }

  _numberTextField(int index) => SizedBox(
        width: 30,
        height: 60,
        child: TextField(
          focusNode: focusNodes[index],
          controller: textControllers[index],
          decoration: InputDecoration(
            counterText: '',
          ),
          keyboardType: TextInputType.number,
          maxLength: 1,
          enableSuggestions: false,
          style: TextStyle(fontSize: 35),
          onTap: () {
            textControllers[index].text = '';
          },
          onChanged: (value) {
            if (value.isNotEmpty) {
              if (index + 1 < 6) {
                _numberSupport = _numberConfirmed.substring(0, index) +
                    value +
                    _numberConfirmed.substring(index + 1);
                _numberConfirmed = _numberSupport;

                FocusScope.of(context).requestFocus(focusNodes[index + 1]);
                textControllers[index + 1].text = '';
              } else {
                FocusScope.of(context).unfocus();
              }
            }
          },
        ),
      );
  @override
  void initState() {
    super.initState();
    for (var e in focusNodes) {
      e.addListener(() {});
    }
    _setTimer();
  }

  @override
  void dispose() {
    for (var e in focusNodes) {
      e.dispose();
    }
    for (var e in textControllers) {
      e.dispose();
    }
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yuu'),
        actions: [
          TextButton(
            child: Text('Resend Code'),
            onPressed: _canResend
                ? () => setState(() {
                      _seconds = maxSeconds;
                      _canResend = false;
                      _setTimer();
                    })
                : null,
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child:
                Text("Please provide your code has been sent via your email!"),
          ),
          //Count down time
          Text("Resend code count down: ${_seconds}"),

          const SizedBox(height: 50),
          Container(
            margin: EdgeInsets.only(left: 50),
            alignment: Alignment.center,
            height: 60.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 12,
              itemBuilder: (_, index) => index % 2 == 0
                  ? _numberTextField((index / 2).truncate())
                  : SizedBox(width: 20),
            ),
          ),
          const SizedBox(height: 50),
          AuthButton(
              onPressed: () {},
              textButton: "Send Code",
              isNotElevatedButtonIcon: true),
          const SizedBox(height: 10),
          AuthButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              textButton: "Cancel",
              isNotElevatedButtonIcon: true)
        ],
      ),
    );
  }
}
