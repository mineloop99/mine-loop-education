import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'auth-button.dart';

class CreateAccountForm extends StatefulWidget {
  const CreateAccountForm({Key key}) : super(key: key);

  @override
  _CreateAccountFormState createState() => _CreateAccountFormState();
}

class _CreateAccountFormState extends State<CreateAccountForm> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  bool _obscureText;
  final _usernameFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  bool _isUsernameControllerEmpty;
  bool _isPasswordControllerEmpty;

  bool _agreeTermsUses = false;

  bool _canSignUp = false;

  @override
  void initState() {
    _usernameController.text = '';
    _passwordController.text = '';
    _obscureText = true;
    _isUsernameControllerEmpty = true;
    _isPasswordControllerEmpty = true;
    _usernameFocusNode.addListener(() {
      print('f');
      setState(() {});
    });
    _passwordFocusNode.addListener(() {
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
    }
  }

  void _createAccountButtonHighlight() {
    if (!_isUsernameControllerEmpty &&
        !_isPasswordControllerEmpty &&
        _agreeTermsUses)
      setState(() {
        _canSignUp = true;
      });
    else
      setState(() {
        _canSignUp = false;
      });
  }

  @override
  void didChangeDependencies() {
    if (_passwordController.text.isEmpty) _isUsernameControllerEmpty = true;
    if (_usernameController.text.isEmpty) _isPasswordControllerEmpty = true;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _usernameFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _deviceSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.topCenter,
            child: Container(
              height: 120,
              width: 120,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.network(
                  'https://i.pinimg.com/564x/11/f8/f0/11f8f0a243fc9214d2a9879fbae4a27d.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                //////Username & Email Field//////
                Container(
                  alignment: Alignment.topCenter,
                  padding: const EdgeInsets.only(right: 2.0, left: 2.0),
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    shadowColor: Colors.black45,
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(230, 248, 255, 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 15.0,
                          child: Icon(
                            Icons.account_circle_sharp,
                          ),
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.blue,
                        ),
                        title: Text(
                          'Email',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Container(
                          height: 60,
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: _usernameController,
                            focusNode: _usernameFocusNode,
                            validator: (value) {
                              if (value.isEmpty || !value.contains('@'))
                                return 'Please enter a valid email address.';
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: 'Enter email...',
                              suffixIcon: _usernameFocusNode.hasFocus
                                  ? IconButton(
                                      icon: Icon(
                                        Icons.clear,
                                      ),
                                      onPressed: _isUsernameControllerEmpty
                                          ? null
                                          : () {
                                              _usernameController.clear();
                                              _isUsernameControllerEmpty = true;
                                              _createAccountButtonHighlight();
                                            },
                                      disabledColor: Colors.black54,
                                    )
                                  : SizedBox(),
                            ),
                            onChanged: (text) {
                              if (text == '' || text == null)
                                setState(() {
                                  _isUsernameControllerEmpty = true;
                                });
                              else
                                setState(() {
                                  _isUsernameControllerEmpty = false;
                                });
                              _createAccountButtonHighlight();
                            },
                            onFieldSubmitted: (_) {
                              FocusScope.of(context)
                                  .requestFocus(_passwordFocusNode);
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(right: 2.0, left: 2.0),
                  height: _deviceSize.height * 0.12,
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    shadowColor: Colors.black45,
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(230, 248, 255, 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
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
                            focusNode: _passwordFocusNode,
                            obscureText: _obscureText,
                            validator: (val) {
                              if (val.isEmpty)
                                return 'Please enter a valid password.';
                              if (val.length < 6)
                                return 'Password at least 6 characters long.';
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: 'Enter password...',
                              suffixIcon: _passwordFocusNode.hasFocus
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
                                  : SizedBox(),
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
                            // onFieldSubmitted: (_) {
                            //   if (_usernameController.text == '' ||
                            //       _usernameController.text == null)
                            //     FocusScope.of(context).requestFocus(_usernameFocusNode);
                            // },
                          ),
                        ),
                        trailing: IconButton(
                          alignment: Alignment.bottomCenter,
                          icon: _obscureText
                              ? Icon(Icons.lock)
                              : Icon(Icons.lock_open),
                          tooltip:
                              _obscureText ? 'Show password' : 'Hide password',
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                Column(
                  children: [
                    Container(
                      width: _deviceSize.width,
                      padding: const EdgeInsets.only(left: 20),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              style: TextStyle(color: Colors.black),
                              text:
                                  'By clicking \"I agree\" to indicate that you have read and agree to the ',
                            ),
                            TextSpan(
                                style: TextStyle(color: Colors.blue),
                                text: 'Terms and Conditions',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () async {
                                    var url = 'https://flutter.dev/';
                                    return await launch(url);
                                  }),
                            TextSpan(
                                style: TextStyle(color: Colors.black),
                                text: ' agreement!'),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                            value: _agreeTermsUses,
                            onChanged: (value) {
                              _agreeTermsUses = value;
                              _createAccountButtonHighlight();
                            },
                          ),
                          Text('I Agree!')
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  child: AuthButton(
                    path: null,
                    onPressed: _canSignUp ? _trySubmit : null,
                    textButton: 'Create Account',
                    isNotElevatedButtonIcon: true,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}