import 'package:flutter/material.dart';
import './grpc/authentication/client.dart';
import 'android-platform-target.dart';
import 'package:provider/provider.dart';
import 'auth/providers/language-provider.dart';
import 'auth/widgets/login-form-widget.dart';
import './home/providers/home-provider.dart';
import './auth/providers/account-provider.dart';
import './error-screen.dart';
import './home/providers/my-account-provider.dart';

void main() {
  ErrorWidget.builder = (FlutterErrorDetails details) => ErrorScreen();
  return runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
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
        ),
        ChangeNotifierProvider(
          create: (_) => AuthenticationClientProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => MyAccountProvider(),
        )
      ],
      child: AndroidPlatformTarget(),
    );
    // foundation.defaultTargetPlatform == TargetPlatform.android
    //     ? AndroidPlatformTarget()
    //     : null);
  }
}
