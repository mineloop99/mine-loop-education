import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './auth_button.dart';

enum LoginMethods {
  MineLoop,
  Google,
  None,
}

//*** Provider For Login Form */
class LoginFormWidgetProvider with ChangeNotifier {
  final Duration containerExpandAnimationDuration = Duration(milliseconds: 500);

  bool isChosingLogin = true;
  LoginMethods loginMethods = LoginMethods.None;
  ////animation /////
  bool isTapExpandedContainerForm = false;
  bool isTapFadeFormLogin = true;

  void chooseLoginMethods() {
    loginMethods = LoginMethods.MineLoop;
    isChosingLogin = false;
    notifyListeners();
  }

  void animationTapCallBack({bool isBackButton = false}) {
    if (isBackButton) {
      loginMethods = LoginMethods.None;
      isChosingLogin = true;
    }
    isTapExpandedContainerForm = !isTapExpandedContainerForm;
    isTapFadeFormLogin = !isTapFadeFormLogin;
    //   isTapExpandedContainerForm = false;
    // isTapFadeFormLogin = true;
    notifyListeners();
  }
}

class LoginFormWidget extends StatefulWidget {
  @override
  _LoginFormWidgetState createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget>
    with TickerProviderStateMixin {
  SigninMineLoopForm signinMineLoopForm;

  LoginFormWidgetProvider _loginFormWidgetProvider;

  AnimationController _animationFadedFadedController;
  Animation<double> _animationFaded;
  int rdTime = new Random().nextInt(1000 - 700);
  @override
  void initState() {
    signinMineLoopForm = SigninMineLoopForm();
    _animationFadedFadedController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animationFaded = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_animationFadedFadedController);
    _animationFadedFadedController.forward(from: 0.0);
    _loginFormWidgetProvider =
        Provider.of<LoginFormWidgetProvider>(context, listen: false);
    super.initState();
  }

  Future<bool> fetchLoginForm() => Future.delayed(
        Duration(milliseconds: rdTime),
        () {
          LoginFormWidget();
          return true;
        },
      );
  @override
  void dispose() {
    _animationFadedFadedController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_loginFormWidgetProvider.isTapFadeFormLogin)
      _animationFadedFadedController.forward(from: 0.0);
    return _loginFormWidgetProvider.isChosingLogin
        ? FadeTransition(
            opacity: _animationFaded,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AuthButton(
                    path: 'assets/images/google_signin_logo.png',
                    textButton: 'Sign in with MineLoop',
                    onPressed: () {
                      setState(() {
                        _loginFormWidgetProvider.chooseLoginMethods();
                        _loginFormWidgetProvider.animationTapCallBack();
                        _animationFadedFadedController.forward(from: 0.0);
                      });
                    },
                    isNotElevatedButtonIcon: false,
                  ),
                  AuthButton(
                    path: 'assets/images/google_signin_logo.png',
                    textButton: 'Sign in with Google',
                    onPressed: () {},
                    isNotElevatedButtonIcon: false,
                  ),
                ],
              ),
            ),
          )
        : _loginFormWidgetProvider.loginMethods == LoginMethods.MineLoop
            ? FutureBuilder(
                future: fetchLoginForm(),
                builder: (context, snapshot) {
                  return !snapshot.hasData
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : FadeTransition(
                          opacity: _animationFaded,
                          child: SigninMineLoopForm(),
                        );
                },
              )
            : SigninGoogleForm();
  }
}

class SigninMineLoopForm extends StatefulWidget {
  @override
  _SigninMineLoopFormState createState() => _SigninMineLoopFormState();
}

class _SigninMineLoopFormState extends State<SigninMineLoopForm> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  bool _obscureText;
  final _usernameFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  bool _isUsernameControllerEmpty;
  bool _isPasswordControllerEmpty;

  bool _rememberMeCheckBox;

  @override
  void initState() {
    _usernameController.text = '';
    _passwordController.text = '';
    _obscureText = true;
    _isUsernameControllerEmpty = true;
    _isPasswordControllerEmpty = true;
    _usernameFocusNode.addListener(() {
      setState(() {});
    });
    _passwordFocusNode.addListener(() {
      setState(() {});
    });
    _rememberMeCheckBox = false;
    _loginFormWidgetProvider =
        Provider.of<LoginFormWidgetProvider>(context, listen: false);

    super.initState();
  }

  void _trySubmit() {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState.save();
    }
  }

  @override
  void didChangeDependencies() {
    _isUsernameControllerEmpty = true;
    _isPasswordControllerEmpty = true;
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

  LoginFormWidgetProvider _loginFormWidgetProvider;

  @override
  Widget build(BuildContext context) {
    final _deviceSize = MediaQuery.of(context).size;
    return Container(
      height: _deviceSize.height * 0.6,
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      width: double.infinity,
      child: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
          children: [
            //////Username & Email Field//////
            Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.only(right: 2.0, left: 2.0),
              height: _deviceSize.height * 0.12,
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
                                          setState(() {
                                            _isUsernameControllerEmpty = true;
                                          });
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
                        },
                        onFieldSubmitted: (_) {
                          FocusScope.of(context)
                              .requestFocus(_passwordFocusNode);
                        },
                      ),
                    ),
                    trailing: IconButton(
                        icon: Icon(Icons.subdirectory_arrow_left),
                        tooltip: 'Back to Login methods',
                        onPressed: () {
                          _loginFormWidgetProvider.animationTapCallBack(
                              isBackButton: true);
                        }),
                  ),
                ),
              ),
            ),
            //////Password Field//////
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
                                    setState(() {
                                      _isPasswordControllerEmpty = true;
                                    });
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
                        },
                        onSaved: (value) {
                          print(_usernameController.text);
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
                      tooltip: _obscureText ? 'Show password' : 'Hide password',
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
            //////Remember me & Forgot password
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        checkColor: Theme.of(context).iconTheme.color,
                        value: _rememberMeCheckBox,
                        onChanged: (value) {
                          setState(() {
                            _rememberMeCheckBox = value;
                          });
                        },
                      ),
                      Text('Remember me.'),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text('Forgot Password?'),
                  ),
                ],
              ),
            ),
            ////// Sign in Button ////////
            Container(
              alignment: Alignment.center,
              child: AuthButton(
                path: null,
                onPressed: _trySubmit,
                textButton: 'Sign In',
                isNotElevatedButtonIcon: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SigninGoogleForm extends StatelessWidget {
  const SigninGoogleForm({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
            leading: Icon(
          Icons.account_circle_rounded,
          color: Theme.of(context).iconTheme.color,
        )),
        ListTile(),
      ],
    );
  }
}
