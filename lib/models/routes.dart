import 'package:flutter/material.dart';

import '../home/screens/home-screen.dart';
import '../home/screens/chat-screen.dart';
import '../home/screens/my-account-screen.dart';
import '../home/screens/search-screen.dart';
import '../home/screens/menu-screen.dart';
import '../auth/screens/create-account-screen.dart';
import '../auth/screens/login_screen.dart';

enum RouteNamesEnum {
  HomeScreen,
  ChatScreen,
  MyAccountScreen,
  SearchScreen,
  Menu,
  Login,
  CreateAccount
}

class Routes {
  static Map<RouteNamesEnum, String> get routeName => {
        //// Routes From Home Folder ////
        RouteNamesEnum.HomeScreen: HomeScreen.routeName,
        RouteNamesEnum.ChatScreen: ChatScreen.routeName,
        RouteNamesEnum.MyAccountScreen: MyAccountScreen.routeName,
        RouteNamesEnum.SearchScreen: SearchScreen.routeName,
        RouteNamesEnum.Menu: MenuScreen.routeName,
        ///// Route From Auth Folder ////
        RouteNamesEnum.CreateAccount: CreateAccountScreen.routeName,
        RouteNamesEnum.Login: LoginScreen.routeName,
      };
  static Map<String, WidgetBuilder> get routes => {
        HomeScreen.routeName: (context) => HomeScreen(),
        ChatScreen.routeName: (context) => ChatScreen(),
        MyAccountScreen.routeName: (context) => MyAccountScreen(),
        SearchScreen.routeName: (context) => SearchScreen(),
        MenuScreen.routeName: (context) => MenuScreen(),
        CreateAccountScreen.routeName: (context) => CreateAccountScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
      };
}
