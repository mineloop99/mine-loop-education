import 'package:flutter/material.dart';
import 'android-platform-target.dart';
import 'package:provider/provider.dart';
import 'auth/providers/language-provider.dart';
import 'auth/widgets/login-form-widget.dart';
import './home/providers/home-provider.dart';
import './auth/providers/account-provider.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LanguageProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => LoginFormWidgetProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => HomeProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => AccountProvider(),
        )
      ],
      child: AndroidPlatformTarget(),
    );
    // foundation.defaultTargetPlatform == TargetPlatform.android
    //     ? AndroidPlatformTarget()
    //     : null);
  }
}
