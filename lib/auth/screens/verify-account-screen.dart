import 'dart:async';
import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import '../../dialog-pop-up/normal-dialog-popup.dart';
import '../../grpc/authentication/client.dart';

class VerifyAccountScreen extends StatefulWidget {
  final Function navigatorFunction;
  final bool isChangePassword;
  const VerifyAccountScreen(
      {@required this.navigatorFunction, @required this.isChangePassword});
  _VerifyAccountScreenState createState() => _VerifyAccountScreenState();
}

class _VerifyAccountScreenState extends State<VerifyAccountScreen> {
  final List<FocusNode> focusNodes = List<FocusNode>.generate(6, (index) {
    return FocusNode();
  });
  final List<TextEditingController> textControllers =
      List<TextEditingController>.generate(6, (index) {
    return TextEditingController();
  });

  static const maxSeconds = 60;
  String _email = '';
  int _seconds = maxSeconds;
  Timer timer;

  bool _canResend = false;

  AuthenticationClientProvider _authenticationClientProvider;

  AsyncMemoizer _asyncMemoizer;

  _sendEmailFuture() async {
    return this._asyncMemoizer.runOnce(() async {
      final respone =
          await AuthenticationAPI.instance.sendEmailVerificationRequest(_email);
      return respone;
    });
  }

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

  void _tryResendCode() {
    setState(() {
      _seconds = maxSeconds;
      _canResend = false;
      _setTimer();
    });
    showDialog(
        context: context,
        barrierDismissible: false,
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
      if (item.text.isNotEmpty) _codeConfirm += item.text;
    }

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return NormalDialogPopup(
            methodCall:
                AuthenticationAPI.instance.sendEmailVerificationCodeRequest(
              _authenticationClientProvider.accountEmail,
              int.parse(_codeConfirm),
              widget.isChangePassword,
            ),
            methodCallWhenPressOk: () {
              Navigator.of(context).pop();
            },
            customNavigatorString: "EMAIL_CONFIRMED",
            customNavigator: () => Future.delayed(
              Duration(milliseconds: 700),
              widget.navigatorFunction,
            ),
          );
        });
  }

  _numberTextField(int index) => SizedBox(
        width: 30,
        height: 60,
        child: TextFormField(
          focusNode: focusNodes[index],
          autofocus: index == 0 ? true : false,
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
    _setTimer();
    _authenticationClientProvider =
        Provider.of<AuthenticationClientProvider>(context, listen: false);
    _asyncMemoizer = AsyncMemoizer();
    _email = _authenticationClientProvider.accountEmail;
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
          _canResend
              ? TextButton(
                  child: const Text('Resend Code'),
                  onPressed: _tryResendCode,
                )
              : TextButton(
                  child: const Text('Email Sent'),
                  onPressed: null,
                )
        ],
      ),
      body: FutureBuilder(
        future: _sendEmailFuture(),
        builder: (_, snapShot) {
          if (!snapShot.hasData)
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
              const SizedBox(height: 180),
            ],
          );
        },
      ),
    );
  }
}
