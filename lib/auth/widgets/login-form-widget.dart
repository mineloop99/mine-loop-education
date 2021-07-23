import 'package:flutter/material.dart';
import 'package:mine_loop_education/auth/providers/account-provider.dart';
import 'package:provider/provider.dart';

import 'auth-button.dart';
import '../../grpc/authentication/client.dart';
import '../../dialog-pop-up/authentication-screen-dialog.dart';

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
  }

  void animationTapCallBack({bool isBackButton = false}) {
    if (isBackButton) {
      loginMethods = LoginMethods.None;
      isChosingLogin = true;
    }
    isTapExpandedContainerForm = !isTapExpandedContainerForm;
    isTapFadeFormLogin = !isTapFadeFormLogin;

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

  AnimationController _animationFadedController;
  Animation<double> _animationFaded;

  bool _firstTimePress = true;

  @override
  void initState() {
    signinMineLoopForm = SigninMineLoopForm();
    _animationFadedController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animationFaded = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_animationFadedController);
    _loginFormWidgetProvider =
        Provider.of<LoginFormWidgetProvider>(context, listen: false);
    _loginFormWidgetProvider.isChosingLogin = true;
    _loginFormWidgetProvider.loginMethods = LoginMethods.None;
    _loginFormWidgetProvider.isTapFadeFormLogin = true;
    super.initState();
  }

  Future<bool> fetchLoginForm() => Future.delayed(
        Duration(milliseconds: 700),
        () {
          LoginFormWidget();
          return true;
        },
      );
  @override
  void dispose() {
    _animationFadedController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_loginFormWidgetProvider.isTapFadeFormLogin)
      _animationFadedController.forward(from: 0.0);
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
                      if (_firstTimePress) {
                        _firstTimePress = false;
                        Future.delayed(Duration(milliseconds: 800), () {
                          Navigator.of(context).pop(true);
                        });
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (ctx) {
                            return Center(child: CircularProgressIndicator());
                          },
                        );
                      }
                      _loginFormWidgetProvider.chooseLoginMethods();
                      _loginFormWidgetProvider.animationTapCallBack();
                      _animationFadedController.forward(from: 0.0);
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
  final _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  bool _obscureText;
  final _usernameFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  bool _isUsernameControllerEmpty;
  bool _isPasswordControllerEmpty;

  bool _autoLoginCheckBox;

  bool _canSignIn = false;

  @override
  void initState() {
    _emailController.text = '';
    _passwordController.text = '';
    _obscureText = true;
    _isUsernameControllerEmpty = true;
    _isPasswordControllerEmpty = true;
    _autoLoginCheckBox = false;
    _usernameFocusNode.addListener(() {
      setState(() {});
    });
    _passwordFocusNode.addListener(() {
      setState(() {});
    });
    _loginFormWidgetProvider =
        Provider.of<LoginFormWidgetProvider>(context, listen: false);

    super.initState();
  }

  void _trySubmit() {
    final isValid = _formKey.currentState.validate();
    setState(() {
      FocusScope.of(context).unfocus();
    });
    if (isValid) {
      _formKey.currentState.save();
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) {
            return AuthenticationScreenDialog(
              methodCall: AuthenticationAPI.instance.callLogin(
                  _emailController.text,
                  _passwordController.text,
                  _autoLoginCheckBox,
                  context),
              isLoginMethod: true,
            );
          });
      Provider.of<AuthenticationClientProvider>(context, listen: false)
          .setEmail(_emailController.text);
    }
  }

  void _createAccountButtonHighlight() {
    if (!_isUsernameControllerEmpty && !_isPasswordControllerEmpty)
      setState(() {
        _canSignIn = true;
      });
    else
      setState(() {
        _canSignIn = false;
      });
  }

  @override
  void didChangeDependencies() {
    if (_passwordController.text.isEmpty) _isUsernameControllerEmpty = true;
    if (_emailController.text.isEmpty) _isPasswordControllerEmpty = true;

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _emailController.dispose();
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
                  borderRadius: BorderRadius.circular(15.0),
                ),
                shadowColor: Colors.black45,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(230, 248, 255, 1),
                    borderRadius: BorderRadius.circular(15.0),
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
                    title: const Text(
                      'Email',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Container(
                      height: 60,
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        textInputAction: TextInputAction.next,
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
                                          _emailController.clear();
                                          _isUsernameControllerEmpty = true;
                                          _createAccountButtonHighlight();
                                        },
                                  disabledColor: Colors.black54,
                                )
                              : const SizedBox(),
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
                    trailing: IconButton(
                        icon: const Icon(Icons.subdirectory_arrow_left),
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
                  borderRadius: BorderRadius.circular(15.0),
                ),
                shadowColor: Colors.black45,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(230, 248, 255, 1),
                    borderRadius: BorderRadius.circular(15.0),
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
                    title: const Text(
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
                                  icon: const Icon(Icons.clear),
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
                        // onFieldSubmitted: (_) {
                        //   if (_emailController.text == '' ||
                        //       _emailController.text == null)
                        //     FocusScope.of(context).requestFocus(_usernameFocusNode);
                        // },
                      ),
                    ),
                    trailing: IconButton(
                      alignment: Alignment.bottomCenter,
                      icon: _obscureText
                          ? const Icon(Icons.lock)
                          : const Icon(Icons.lock_open),
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
                        value: _autoLoginCheckBox,
                        onChanged: (value) {
                          setState(() {
                            _autoLoginCheckBox = value;
                          });
                        },
                      ),
                      const Text('Auto Login'),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Forgot Password?'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ////// Sign in Button ////////
            Container(
              alignment: Alignment.center,
              child: AuthButton(
                path: null,
                onPressed: _canSignIn ? _trySubmit : null,
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
