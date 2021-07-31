import 'package:flutter/material.dart';
import '../../../dialog-pop-up/normal-dialog-popup.dart';
import '../../../grpc/authentication/client.dart';

/*
  Need Form Validation
  Need Connection
*/

class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  bool _isHidePassword = true;
  bool _isHideNewPassword = true;
  bool _isHideConfirmNewPassword = true;

  final _newPasswordFocusNode = FocusNode();
  final _confirmNewPasswordFocusNode = FocusNode();

  InputDecoration buildInputDecoration(
      String hinttext, bool isHidePassword, Function onPressed) {
    return InputDecoration(
      hintText: hinttext,
      suffixIcon: IconButton(
        icon: Icon(
            isHidePassword ? Icons.lock_outline : Icons.lock_open_outlined),
        onPressed: onPressed,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(color: Colors.purple, width: 1.5),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(
          color: Colors.blue,
          width: 1.5,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(
          color: Colors.blue,
          width: 1.5,
        ),
      ),
    );
  }

  void _trySubmit() {
    FocusScope.of(context).unfocus();
    bool _isValid = _formKey.currentState.validate();
    if (_isValid) {
      _formKey.currentState.save();
      showDialog(
          context: context,
          builder: (ctx) => NormalDialogPopup(
                methodCall: AuthenticationAPI.instance
                    .callChangePasswordWithOldPassword(
                  oldPassword.text,
                  newPassword.text,
                ),
                twoTextButton: false,
                showSnackBarMessage: "PASSWORD_CHANGED",
                contextSnackBarMessage: context,
                customNavigatorString: "PASSWORD_CHANGED",
                customNavigator: () {
                  Navigator.of(context).pop();
                },
                methodCallWhenPressOk: () {
                  Navigator.of(context).pop();
                },
              ));
    }
  }

  final oldPassword = TextEditingController();
  final newPassword = TextEditingController();
  final confirmNewPassword = TextEditingController();

  @override
  void initState() {
    super.initState();
    _newPasswordFocusNode.addListener(() {});

    _confirmNewPasswordFocusNode.addListener(() {});
  }

  @override
  void dispose() {
    super.dispose();
    oldPassword.dispose();
    newPassword.dispose();
    confirmNewPassword.dispose();
    _newPasswordFocusNode.dispose();
    _confirmNewPasswordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Change Password"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                child: TextFormField(
                  controller: oldPassword,
                  obscureText: _isHidePassword,
                  keyboardType: TextInputType.text,
                  decoration: buildInputDecoration(
                    "Old Password",
                    _isHidePassword,
                    () {
                      setState(() {
                        _isHidePassword = !_isHidePassword;
                      });
                    },
                  ),
                  validator: (value) {
                    if (value.isEmpty) return 'Please Enter a valid Password';

                    if (value.length < 6)
                      return 'Password must be at least 6 characters long';
                    return null;
                  },
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_newPasswordFocusNode);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                child: TextFormField(
                  controller: newPassword,
                  focusNode: _newPasswordFocusNode,
                  obscureText: _isHideNewPassword,
                  keyboardType: TextInputType.text,
                  decoration: buildInputDecoration(
                      "New Password", _isHideNewPassword, () {
                    setState(() {
                      _isHideNewPassword = !_isHideNewPassword;
                    });
                  }),
                  validator: (String value) {
                    if (value.isEmpty)
                      return 'Please a Enter new Password';
                    else if (value.length < 6)
                      return 'New password must be at least 6 characters long';
                    else if (value == oldPassword.text)
                      return 'New password not same as Old Password';

                    return null;
                  },
                  onFieldSubmitted: (_) {
                    FocusScope.of(context)
                        .requestFocus(_confirmNewPasswordFocusNode);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                child: TextFormField(
                  controller: confirmNewPassword,
                  focusNode: _confirmNewPasswordFocusNode,
                  obscureText: _isHideConfirmNewPassword,
                  keyboardType: TextInputType.text,
                  decoration: buildInputDecoration(
                      "Confirm New Password", _isHideConfirmNewPassword, () {
                    setState(() {
                      _isHideConfirmNewPassword = !_isHideConfirmNewPassword;
                    });
                  }),
                  validator: (String value) {
                    if (value.isEmpty) return 'Please re-enter new password';
                    if (newPassword.text != confirmNewPassword.text) {
                      return "New password does not match";
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    textStyle: TextStyle(
                      color: Colors.white,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        side: BorderSide(color: Colors.blue, width: 2)),
                  ),
                  onPressed: _trySubmit,
                  child: Text("Submit"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
