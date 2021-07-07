import 'package:flutter/material.dart';

import './auth/screens/login_screen.dart';
import './models/routes.dart';

class AndroidPlatformTarget extends StatelessWidget {
  const AndroidPlatformTarget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mine Loop Education',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        backgroundColor: Colors.lightBlue,
        accentColor: Colors.deepPurple,
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
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Colors.blue,
            unselectedItemColor: Colors.blue[200],
            selectedItemColor: Colors.white),
        errorColor: Colors.red,
      ),
      home: LoginScreen() //LoginScreen(),
      ,
      routes: Routes.routes,
    );
  }
}
