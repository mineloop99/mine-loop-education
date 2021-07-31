import 'package:flutter/foundation.dart';
import '../../models/account.dart';

class AccountProvider with ChangeNotifier {
  AuthInformation _authInformation;
  UserInformation _userInformation;

  bool _isLogged = false;

  bool get isLogged {
    return _isLogged;
  }

  void setLogged(bool setLogged) {
    _isLogged = setLogged;
    notifyListeners();
  }

  static AccountProvider instance = AccountProvider();

  AuthInformation get authInformation {
    return _authInformation;
  }

  UserInformation get userInformation {
    return _userInformation;
  }

  void setToken(String token, DateTime expiryDate) {
    _authInformation = AuthInformation(
      token: token,
      expiryDate: expiryDate,
    );
  }
}
