import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/account.dart';

class AccountProvider with ChangeNotifier {
  AuthInformation _authInformation;
  AccountInformation _accountInformation;

  bool _isLogged = false;

  bool get isLogged {
    return _isLogged;
  }

  void setLogged() {
    _isLogged = !isLogged;
    notifyListeners();
  }

  static AccountProvider instance = AccountProvider();

  AuthInformation get authInformation {
    return _authInformation;
  }

  AccountInformation get accountInformation {
    return _accountInformation;
  }

  void setToken(String token, DateTime expiryDate) {
    _authInformation = AuthInformation(
      token: token,
      expiryDate: expiryDate,
    );
  }

  Future<void> logout() async {
    _authInformation = new AuthInformation(token: '', expiryDate: null);
    notifyListeners();
    final sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.remove('userData');
  }
}
