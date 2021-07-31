import 'package:flutter/material.dart';
import 'package:mine_loop_education/dialog-pop-up/authentication-screen-dialog.dart';
import 'package:mine_loop_education/grpc/authentication/client.dart';
import 'package:mine_loop_education/home/providers/home-provider.dart';

import 'package:mine_loop_education/home/screens/chat-screen.dart';

import 'package:mine_loop_education/home/screens/events-screen.dart';
import 'package:mine_loop_education/home/screens/my-account-screen.dart';
import 'package:mine_loop_education/home/screens/my-account-screens/edit-profile-screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './auth/screens/login-screen.dart';
import './home/screens/home-screen.dart';
import 'auth/providers/account-provider.dart';
import 'auth/screens/verify-account-screen.dart';
import 'package:mine_loop_education/auth/screens/forgot-password-screen.dart';
import './dialog-pop-up/edit-dialog-pop-up.dart';
import 'models/routes.dart';
import './home/screens/splash_screen.dart';

class AndroidPlatformTarget extends StatefulWidget {
  @override
  _AndroidPlatformTargetState createState() => _AndroidPlatformTargetState();
}

class _AndroidPlatformTargetState extends State<AndroidPlatformTarget> {
  final _tryLogin = AuthenticationAPI.instance.tryAutoLogin();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mine Loop Education',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        backgroundColor: Colors.lightBlue,
        accentColor: Colors.blue,
        accentColorBrightness: Brightness.dark,
        disabledColor: Colors.black54,
        iconTheme: IconThemeData(
          color: Colors.lightBlue,
        ),
        buttonTheme: ButtonTheme.of(context).copyWith(
          buttonColor: Colors.lightBlue,
          textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        /*
        Dark Theme Opacity:
        - High-emphasis text should have an opacity of 87%.
        - Medium emphasis text is applied at 60%.
        - Disabled text uses an opacity of 38%. 
        */
        primaryColorDark: Color.fromRGBO(18, 18, 18, 1),
        appBarTheme: AppBarTheme.of(context).copyWith(
          color: Colors.white,
          centerTitle: true,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Colors.blue,
            unselectedItemColor: Colors.blue[200],
            selectedItemColor: Colors.white),
        errorColor: Colors.red,
        bannerTheme: MaterialBannerTheme.of(context).copyWith(
          backgroundColor: Colors.white,
        ),
        primaryTextTheme:
            TextTheme(caption: TextStyle(fontWeight: FontWeight.w300)),

        ///Format Text
        textTheme: TextTheme(
          headline6: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
          headline5: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),

          ///For light mode
          subtitle1: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),
          subtitle2: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      home: Consumer<AccountProvider>(
        builder: (_, _accountProvider, __) {
          return FutureBuilder(
            future: _tryLogin,
            builder: (_, snapshot) =>
                snapshot.connectionState == ConnectionState.waiting
                    ? SplashScreen()
                    : snapshot.hasData && snapshot.data == "OK"
                        ? HomeScreen()
                        : LoginScreen(),
          );
        },
      ),
      routes: Routes.routes,
    );
  }
}
