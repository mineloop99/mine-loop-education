import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/login_form_widget.dart';
import '../../auth/widgets/dropdown_widget.dart';
import '../widgets/create_form_widget.dart';

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

  @override
  void initState() {
    flexibleNumber[LoginScreenFlexible.notch] = 1;
    flexibleNumber[LoginScreenFlexible.logo] = 2;
    flexibleNumber[LoginScreenFlexible.welcomeText] = 1;
    flexibleNumber[LoginScreenFlexible.loginForm] = 5;
    flexibleNumber[LoginScreenFlexible.createAccount] = 1;
    flexibleNumber[LoginScreenFlexible.termsAndConditions] = 1;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
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
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                height: deviceSize.height * 0.6,
                width: deviceSize.width * 0.35,
                padding:
                    EdgeInsets.only(top: 50, right: deviceSize.width * 0.03),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              height: deviceSize.height,
              width: deviceSize.width,
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
                            child: Container()),
                        /////Logo/////
                        Flexible(
                          flex: flexibleNumber[LoginScreenFlexible.logo],
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                'https://i.pinimg.com/564x/11/f8/f0/11f8f0a243fc9214d2a9879fbae4a27d.jpg',
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
                        /////Signin Text/////
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 5),
                          child: Text(
                            'sign in to continue.',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  //////Login Form//////
                  Flexible(
                      flex: flexibleNumber[LoginScreenFlexible.loginForm],
                      child: Consumer<LoginFormWidgetProvider>(
                        builder: (ctx, _loginFormWidgetProvider, _) =>
                            AnimatedContainer(
                          duration: _loginFormWidgetProvider
                              .containerExpandAnimationDuration,
                          height: _loginFormWidgetProvider
                                  .isTapExpandedContainerForm
                              ? 300
                              : 100,
                          curve: Curves.decelerate,
                          child: LoginFormWidget(),
                        ),
                      )),
                  Flexible(
                    flex: flexibleNumber[LoginScreenFlexible.createAccount] +
                        flexibleNumber[LoginScreenFlexible.createAccount],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
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
                  SizedBox(
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
