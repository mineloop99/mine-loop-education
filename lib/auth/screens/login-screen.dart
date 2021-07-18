import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/login-form-widget.dart';
import '../widgets/dropdown-widget.dart';
import '../widgets/create-form-widget.dart';
import '../../models/routes.dart';

enum LoginScreenFlexible {
  notch,
  logo,
  welcomeText,
  loginForm,
  createAccount,
  termsAndConditions
}

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var flexibleNumber = Map<LoginScreenFlexible, int>();
  void _launchUrl() async => await launch('https://flutter.dev');

  Future<void> _fetchLoginForm;
  @override
  void initState() {
    flexibleNumber[LoginScreenFlexible.notch] = 1;
    flexibleNumber[LoginScreenFlexible.logo] = 2;
    flexibleNumber[LoginScreenFlexible.welcomeText] = 1;
    flexibleNumber[LoginScreenFlexible.createAccount] = 2;
    flexibleNumber[LoginScreenFlexible.termsAndConditions] = 1;
    _fetchLoginForm = fetchLoginForm();
    super.initState();
  }

  Future<void> fetchLoginForm() {
    return Future.delayed(Duration(milliseconds: 700), () {});
  }

  Widget build(BuildContext context) {
    @override
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Container(
              height: deviceSize.height * 0.6,
              width: deviceSize.width * 0.35,
              padding: EdgeInsets.only(top: 50, right: deviceSize.width * 0.03),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              height: deviceSize.height,
              width: deviceSize.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  stops: [0.0, 0.2, 0.9],
                  colors: [
                    const Color(0xFFc2e9fb),
                    const Color(0xFFa3bded),
                    const Color(0xFFc2e9fb),
                  ],
                ),
                //color: Color.fromRGBO(240, 248, 255, 1),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ///////Headers/////
                  Flexible(
                    flex: flexibleNumber[LoginScreenFlexible.logo] +
                        flexibleNumber[LoginScreenFlexible.welcomeText] +
                        flexibleNumber[LoginScreenFlexible.notch],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ////Notch/////
                        Expanded(
                          flex: flexibleNumber[LoginScreenFlexible.notch],
                          child: IconButton(
                            icon: Icon(Icons.dangerous),
                            color: Colors.red,
                            onPressed: () {
                              Navigator.of(context).pushReplacementNamed(
                                  Routes.routeName[RouteNamesEnum.Home]);
                            },
                          ),
                        ),
                        /////Logo/////
                        Flexible(
                          flex: flexibleNumber[LoginScreenFlexible.logo],
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            width: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: NetworkImage(
                                    'https://i.pinimg.com/originals/73/ed/e2/73ede2610b35468be26a77f04092535c.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        /////Welcome Sign/////
                        Flexible(
                          flex: flexibleNumber[LoginScreenFlexible.welcomeText],
                          child: Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Text(
                              'Welcome Back,',
                              style:
                                  TextStyle(fontSize: deviceSize.height * 0.04),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //////Login Form//////
                  FutureBuilder(
                      future: _fetchLoginForm,
                      builder: (context, snapshot) {
                        return snapshot.connectionState ==
                                ConnectionState.waiting
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : Consumer<LoginFormWidgetProvider>(
                                builder: (ctx, _loginFormWidgetProvider, _) =>
                                    AnimatedContainer(
                                  alignment: Alignment.bottomCenter,
                                  duration: _loginFormWidgetProvider
                                      .containerExpandAnimationDuration,
                                  height: _loginFormWidgetProvider
                                          .isTapExpandedContainerForm
                                      ? 350
                                      : 100,
                                  curve: Curves.decelerate,
                                  child: LoginFormWidget(),
                                ),
                              );
                      }),
                  Expanded(
                    flex: flexibleNumber[LoginScreenFlexible.createAccount] +
                        flexibleNumber[LoginScreenFlexible.createAccount],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 3,
                        ),
                        Text('Don\'t have an account yet?'),
                        Expanded(
                            flex: flexibleNumber[
                                    LoginScreenFlexible.createAccount] +
                                flexibleNumber[
                                    LoginScreenFlexible.createAccount],
                            child: CreateFromWidget()),
                      ],
                    ),
                  ),
                  DropDownWidget(),
                  InkWell(
                    child: new Text('Terms and Conditions'),
                    onTap: _launchUrl,
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
