import 'package:flutter/material.dart';
import './home/screens/home-screen.dart';
import './auth/screens/login_screen.dart';

class AndroidPlatformTarget extends StatelessWidget {
  const AndroidPlatformTarget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Mine Loop Education',
        theme: ThemeData(
          accentColor: Colors.blue[100],
          primaryColor: Colors.blue,
          primarySwatch: Colors.blue,
          disabledColor: Colors.black54,
          iconTheme: IconThemeData(
            color: Colors.blue,
          ),
          /*
        Dark Theme Opacity:
        - High-emphasis text should have an opacity of 87%.
        - Medium emphasis text is applied at 60%.
        - Disabled text uses an opacity of 38%. 
        */
          primaryColorDark: Color.fromRGBO(18, 18, 18, 1),
          errorColor: Colors.red,
        ),
        home: HomeScreen() //LoginScreen(),
        );
  }
}
