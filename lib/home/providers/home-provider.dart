import 'package:flutter/cupertino.dart';

class HomeProvider with ChangeNotifier {
  int _currentIndexPage = 0;
  bool _isLogged = false;

  int get currentIndexPage {
    return _currentIndexPage;
  }

  void setCurrentIndexPage(int index) {
    _currentIndexPage = index;
  }

  bool get isLogged {
    return _isLogged;
  }

  void setLogged() {
    _isLogged = true;
    notifyListeners();
  }
}
