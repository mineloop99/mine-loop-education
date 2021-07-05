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

  @override
  void initState() {
    signinMineLoopForm = SigninMineLoopForm();
    _animationFadedFadedController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animationFaded = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_animationFadedFadedController);
    _animationFadedFadedController.forward(from: 0.0);
    super.initState();
  }

  @override
  void dispose() {
    _animationFadedFadedController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _loginFormWidgetProvider = Provider.of<LoginFormWidgetProvider>(context);
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
            ? FadeTransition(
                opacity: _animationFaded,
                child: SigninMineLoopForm(),
              )
            : SigninGoogleForm();
  }
}

class SigninMineLoopForm extends StatefulWidget {
  @override
  _SigninMineLoopFormState createState() => _SigninMineLoopFormState();
}

class _SigninMineLoopFormState extends State<SigninMineLoopForm> {
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
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _isUsernameControllerEmpty = false;
    _isPasswordControllerEmpty = false;
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
    _loginFormWidgetProvider = Provider.of<LoginFormWidgetProvider>(context);
    final _deviceSize = MediaQuery.of(context).size;
    return Container(
      height: _deviceSize.height * 0.6,
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        // gradient: LinearGradient(
        //   begin: Alignment.topRight,
        //   end: Alignment.bottomLeft,
        //   stops: [0.0, 0.2, 0.9],
        //   colors: [
        //     const Color(0xFFc2e9fb),
        //     const Color(0xFFa3bded),
        //     const Color(0xFFc2e9fb),
        //   ],
        // ),
        color: Color.fromRGBO(232, 245, 255, 1),
      ),
      width: double.infinity,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
        children: [
          //////Username Field//////
          Container(
            alignment: Alignment.center,
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
                  color: Color.fromRGBO(230, 248, 255, 1),
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
                  subtitle: TextFormField(
                    controller: _usernameController,
                    focusNode: _usernameFocusNode,
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
                      FocusScope.of(context).requestFocus(_passwordFocusNode);
                    },
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
                  color: Color.fromRGBO(230, 248, 255, 1),
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
                    child: TextFormField(
                      controller: _passwordController,
                      focusNode: _passwordFocusNode,
                      obscureText: _obscureText,
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
                      validator: (val) =>
                          val.length < 6 ? 'Password too short.' : null,
                      // onFieldSubmitted: (_) {
                      //   if (_usernameController.text == '' ||
                      //       _usernameController.text == null)
                      //     FocusScope.of(context).requestFocus(_usernameFocusNode);
                      // },
                    ),
                  ),
                  trailing: IconButton(
                    alignment: Alignment.bottomCenter,
                    icon:
                        _obscureText ? Icon(Icons.lock) : Icon(Icons.lock_open),
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
          Container(
            alignment: Alignment.center,
            child: AuthButton(
              path: null,
              onPressed: () {},
              textButton: 'Sign In',
              isNotElevatedButtonIcon: true,
            ),
          ),
        ],
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
