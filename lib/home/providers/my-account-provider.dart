import 'package:flutter/material.dart';

import '../../models/account.dart';

class MyAccountProvider with ChangeNotifier {
  UserInformation _userInformation;
  static MyAccountProvider instance;

  UserInformation get userInformation {
    return _userInformation;
  }

  void setUserInformation(String _username, String _userPhoneNumber,
      DateTime _birthday, String _userSex, String _userEmail) {
    _userInformation = UserInformation(
        name: _username,
        phoneNumber: _userPhoneNumber,
        sex: _userSex,
        birthday: _birthday,
        email: _userEmail);
    notifyListeners();
  }
}
