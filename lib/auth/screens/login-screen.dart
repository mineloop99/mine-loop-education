import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/login-form-widget.dart';
import '../widgets/dropdown-widget.dart';
import '../widgets/create-form-widget.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final flexibleNumber = {
    'notch': 1,
    'logo': 2,
    'welcomeText': 1,
    'createAccount': 2,
    'termsAndConditions': 1,
  };
  @override
  void initState() {
    super.initState();
    Provider.of<LoginFormWidgetProvider>(context, listen: false)
        .isTapExpandedContainerForm = false;
  }

  void _launchUrl() async => await launch('https://flutter.dev');

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
                    flex: flexibleNumber['logo'] +
                        flexibleNumber['welcomeText'] +
                        flexibleNumber['notch'],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ////Notch/////
                        Expanded(
                            flex: flexibleNumber['notch'],
                            child: const SizedBox()),
                        /////Logo/////
                        Flexible(
                          flex: flexibleNumber['logo'],
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            width: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: const NetworkImage(
                                    'https://i.pinimg.com/originals/73/ed/e2/73ede2610b35468be26a77f04092535c.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        /////Welcome Sign/////
                        Flexible(
                          flex: flexibleNumber['welcomeText'],
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
                  Consumer<LoginFormWidgetProvider>(
                    builder: (ctx, _loginFormWidgetProvider, _) =>
                        AnimatedContainer(
                      alignment: Alignment.bottomCenter,
                      duration: _loginFormWidgetProvider
                          .containerExpandAnimationDuration,
                      height:
                          _loginFormWidgetProvider.isTapExpandedContainerForm
                              ? 350
                              : 100,
                      curve: Curves.linearToEaseOut,
                      child: LoginFormWidget(),
                    ),
                  ),

                  /// Form Register
                  Expanded(
                    flex: flexibleNumber['createAccount'] +
                        flexibleNumber['createAccount'],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 3,
                        ),
                        const Text('Don\'t have an account yet?'),
                        Expanded(
                            flex: flexibleNumber['createAccount'] +
                                flexibleNumber['createAccount'],
                            child: CreateFromWidget()),
                      ],
                    ),
                  ),
                  DropDownWidget(),
                  InkWell(
                    child: const Text('Terms and Conditions'),
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
