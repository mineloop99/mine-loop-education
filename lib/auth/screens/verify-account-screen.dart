import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../dialog-pop-up/normal-dialog-popup.dart';
import 'package:provider/provider.dart';
import '../../auth/widgets/auth-button.dart';
import '../../grpc/authentication/client.dart';

class ConfirmAccountScreen extends StatefulWidget {
  _ConfirmAccountScreenState createState() => _ConfirmAccountScreenState();
}

class _ConfirmAccountScreenState extends State<ConfirmAccountScreen> {
  final List<FocusNode> focusNodes = List<FocusNode>.generate(6, (index) {
    return FocusNode();
  });
  final List<TextEditingController> textControllers =
      List<TextEditingController>.generate(6, (index) {
    return TextEditingController();
  });

  static const maxSeconds = 60;
  int _seconds = maxSeconds;
  Timer timer;

  bool _canResend = false;

  AuthenticationClientProvider _authenticationClientProvider;
  Future<void> _myFuture;

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

  bool _firstTimeFuture = true;
  void _tryResendCode() {
    setState(() {
      _seconds = maxSeconds;
      _canResend = false;
      _setTimer();
    });
    showDialog(
        context: context,
        builder: (_) {
          return NormalDialogPopup(
            methodCall: AuthenticationAPI.instance.sendEmailVerificationRequest(
              _authenticationClientProvider.accountEmail,
            ),
            methodCallWhenPressOk: () {
              Navigator.of(context).pop();
            },
          );
        });
  }

  void _trySubmit() {
    FocusScope.of(context).unfocus();
    String _codeConfirm = "";
    for (var item in textControllers) {
      _codeConfirm += item.text;
    }
    showDialog(
        context: context,
        builder: (_) {
          return NormalDialogPopup(
            methodCall:
                AuthenticationAPI.instance.sendEmailVerificationCodeRequest(
              _authenticationClientProvider.accountEmail,
              int.parse(_codeConfirm),
            ),
            methodCallWhenPressOk: () {
              Navigator.of(context).pop();
            },
          );
        });
  }

  _numberTextField(int index) => SizedBox(
        width: 30,
        height: 60,
        child: TextField(
          focusNode: focusNodes[index],
          controller: textControllers[index],
          decoration: const InputDecoration(
            counterText: '',
          ),
          keyboardType: TextInputType.number,
          maxLength: 1,
          style: const TextStyle(fontSize: 35),
          onTap: () {
            textControllers[index].text = '';
          },
          onChanged: (value) {
            if (value.isNotEmpty) {
              if (index + 1 < 6) {
                FocusScope.of(context).requestFocus(focusNodes[index + 1]);
                textControllers[index + 1].text = '';
              } else if (index == 5) {
                _trySubmit();
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
    _authenticationClientProvider =
        Provider.of<AuthenticationClientProvider>(context, listen: false);
    _myFuture = AuthenticationAPI.instance.sendEmailVerificationRequest(
      _authenticationClientProvider.accountEmail,
    );
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
        title: const Text('Yuu'),
        actions: [
          TextButton(
            child: const Text('Resend Code'),
            onPressed: _canResend ? _tryResendCode : null,
          )
        ],
      ),
      body: FutureBuilder(
        future: _myFuture,
        builder: (_, snapShot) {
          if (_firstTimeFuture) {
            _firstTimeFuture = false;
            _myFuture = Future.delayed(Duration.zero);
          }
          if (snapShot.connectionState == ConnectionState.waiting)
            return Center(child: const CircularProgressIndicator());
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                    "Please provide your code has been sent via your email!"),
              ),
              //Count down time
              Text("Resend code count down: $_seconds"),

              const SizedBox(height: 50),
              Container(
                margin: const EdgeInsets.only(left: 50),
                alignment: Alignment.center,
                height: 60.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 12,
                  itemBuilder: (_, index) => index % 2 == 0
                      ? _numberTextField((index / 2).truncate())
                      : const SizedBox(width: 20),
                ),
              ),
              const SizedBox(height: 50),
              AuthButton(
                  onPressed: _trySubmit,
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
          );
        },
      ),
    );
  }
}
