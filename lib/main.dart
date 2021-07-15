import 'package:flutter/material.dart';
import 'android-platform-target.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'auth/providers/language-provider.dart';
import 'auth/widgets/login-form-widget.dart';
import './home/providers/home-provider.dart';

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
        ],
        child: foundation.defaultTargetPlatform == TargetPlatform.android
            ? AndroidPlatformTarget()
            : null);
  }
}
