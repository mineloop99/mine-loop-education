import 'package:flutter/material.dart';
import 'package:mine_loop_education/dialog-pop-up/normal-dialog-popup.dart';
import 'package:provider/provider.dart';
import '../../grpc/authentication/client.dart';
import 'auth-button.dart';

class ForgotPasswordWidget extends StatefulWidget {
  final Function navigator;
  const ForgotPasswordWidget(this.navigator);
  @override
  _ForgotPasswordWidgetState createState() => _ForgotPasswordWidgetState();
}

class _ForgotPasswordWidgetState extends State<ForgotPasswordWidget> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  bool _obscurePassword;
  bool _obscureConfirmPassword;
  final _passwordFocusnode = FocusNode();
  final _confirmPasswordFocusnode = FocusNode();
  bool _isPasswordControllerEmpty;
  bool _isConfirmPasswordControllerEmpty;

  bool _canSignUp = false;

  @override
  void initState() {
    _passwordController.text = '';
    _confirmPasswordController.text = '';
    _obscurePassword = true;
    _obscureConfirmPassword = true;
    _isPasswordControllerEmpty = true;
    _isConfirmPasswordControllerEmpty = true;
    _passwordFocusnode.addListener(() {
      setState(() {});
    });
    _confirmPasswordFocusnode.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  void _trySubmit() {
    FocusScope.of(context).unfocus();
    final isValid = _formKey.currentState.validate();
    setState(() {});
    if (isValid) {
      _formKey.currentState.save();
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) {
            return NormalDialogPopup(
              methodCall: AuthenticationAPI.instance
                  .changePassword(_passwordController.text),
              methodCallWhenPressOk: () => Navigator.of(context).pop(),
              customNavigator: widget.navigator,
              customNavigatorString: "PASSWORD_HAS_BEEN_CHANGED",
              twoTextButton: false,
            );
          });
      Provider.of<AuthenticationClientProvider>(context, listen: false)
          .setEmail(_passwordController.text);
    }
  }

  void _createAccountButtonHighlight() {
    if (!_isPasswordControllerEmpty && !_isConfirmPasswordControllerEmpty)
      setState(() {
        _canSignUp = true;
      });
    else
      setState(() {
        _canSignUp = false;
      });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _passwordFocusnode.dispose();
    _confirmPasswordFocusnode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _deviceSize = MediaQuery.of(context).size;
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              child: Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://i.pinimg.com/originals/73/ed/e2/73ede2610b35468be26a77f04092535c.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  ////// Tooltips/////
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(20),
                    child: const Text(
                      'Please provide your new password to continue...',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  //////Email Field//////
                  Container(
                    alignment: Alignment.topCenter,
                    padding: const EdgeInsets.only(right: 2.0, left: 2.0),
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      shadowColor: Colors.black45,
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(230, 248, 255, 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ListTile(
                          leading: const CircleAvatar(
                            radius: 15.0,
                            child: Icon(
                              Icons.vpn_key,
                            ),
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.blue,
                          ),
                          title: Text(
                            'Password',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Container(
                            height: 60,
                            child: TextFormField(
                              controller: _passwordController,
                              focusNode: _passwordFocusnode,
                              obscureText: _obscurePassword,
                              validator: (val) {
                                if (val.isEmpty)
                                  return 'Please enter a valid password.';
                                if (val.length < 6)
                                  return 'Password at least 6 characters long.';
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: 'Enter new password...',
                                suffixIcon: _passwordFocusnode.hasFocus
                                    ? IconButton(
                                        icon: Icon(Icons.clear),
                                        onPressed: () {
                                          _passwordController.clear();
                                          _isPasswordControllerEmpty = true;
                                          _createAccountButtonHighlight();
                                        },
                                        color: _isPasswordControllerEmpty
                                            ? Colors.black54
                                            : Colors.blue,
                                      )
                                    : const SizedBox(),
                              ),
                              onChanged: (text) {
                                if (text == '' || text == null)
                                  setState(() {
                                    _isPasswordControllerEmpty = true;
                                  });
                                else
                                  setState(() {
                                    _isPasswordControllerEmpty = false;
                                  });

                                _createAccountButtonHighlight();
                              },
                              onSaved: (_) {
                                FocusScope.of(context)
                                    .requestFocus(_confirmPasswordFocusnode);
                              },
                            ),
                          ),
                          trailing: IconButton(
                            alignment: Alignment.bottomCenter,
                            icon: _obscurePassword
                                ? Icon(Icons.lock)
                                : Icon(Icons.lock_open),
                            tooltip: _obscurePassword
                                ? 'Show password'
                                : 'Hide password',
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ),

                  /// Password ////
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(right: 2.0, left: 2.0),
                    height: _deviceSize.height * 0.12,
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      shadowColor: Colors.black45,
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(230, 248, 255, 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ListTile(
                          leading: const CircleAvatar(
                            radius: 15.0,
                            child: Icon(
                              Icons.vpn_key,
                            ),
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.blue,
                          ),
                          title: Text(
                            'Confirm Password',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Container(
                            height: 60,
                            child: TextFormField(
                              controller: _confirmPasswordController,
                              focusNode: _confirmPasswordFocusnode,
                              obscureText: _obscureConfirmPassword,
                              validator: (val) {
                                if (val.isEmpty)
                                  return 'Please enter a valid password.';
                                if (val.length < 6)
                                  return 'Password at least 6 characters long.';
                                if (val != _passwordController.text)
                                  return 'Confirm password won\'t matched';
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: 'Confirm your password...',
                                suffixIcon: _confirmPasswordFocusnode.hasFocus
                                    ? IconButton(
                                        icon: Icon(Icons.clear),
                                        onPressed: () {
                                          _confirmPasswordController.clear();
                                          _isConfirmPasswordControllerEmpty =
                                              true;
                                          _createAccountButtonHighlight();
                                        },
                                        color: _isConfirmPasswordControllerEmpty
                                            ? Colors.black54
                                            : Colors.blue,
                                      )
                                    : const SizedBox(),
                              ),
                              onChanged: (text) {
                                if (text == '' || text == null)
                                  setState(() {
                                    _isConfirmPasswordControllerEmpty = true;
                                  });
                                else
                                  setState(() {
                                    _isConfirmPasswordControllerEmpty = false;
                                  });

                                _createAccountButtonHighlight();
                              },
                            ),
                          ),
                          trailing: IconButton(
                            alignment: Alignment.bottomCenter,
                            icon: _obscureConfirmPassword
                                ? Icon(Icons.lock)
                                : Icon(Icons.lock_open),
                            tooltip: _obscureConfirmPassword
                                ? 'Show password'
                                : 'Hide password',
                            onPressed: () {
                              setState(() {
                                _obscureConfirmPassword =
                                    !_obscureConfirmPassword;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: AuthButton(
                      path: null,
                      onPressed: _canSignUp ? _trySubmit : null,
                      textButton: 'Change Password',
                      isNotElevatedButtonIcon: true,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: AuthButton(
                      path: null,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      textButton: 'Cancel',
                      isNotElevatedButtonIcon: true,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30)
          ],
        ),
      ),
    );
  }
}
