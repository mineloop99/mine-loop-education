import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:mine_loop_education/auth/models/account.dart';
import 'package:mine_loop_education/models/routes.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:crypto/crypto.dart' as hash;

import '../../auth/providers/account-provider.dart' show AccountProvider;
import '../../grpc/authentication/authenticationpb/authentication.pbgrpc.dart';
import '../../helpers/device-helper.dart' as deviceHelper;

const ip = '13.75.66.33'; //"10.0.2.2";
const ipLocal = "10.0.2.2";
const isLocal = true;
const port = 50010;

class AuthenticationClientProvider with ChangeNotifier {
  String _accountEmail;

  String get accountEmail {
    return _accountEmail;
  }

  void setEmail(String email) {
    _accountEmail = email;
  }
}

class AuthenticationAPI {
  static AuthenticationAPI instance = AuthenticationAPI();
  AuthenticationClient _client;

  final Duration _clientTimeOut = Duration(seconds: 5);

  void clientAuthInit() {
    final channel = ClientChannel(
      isLocal ? ipLocal : ip,
      port: port,
      options: ChannelOptions(
        credentials: ChannelCredentials.insecure(),
        idleTimeout: Duration(seconds: 10),
      ),
    );
    _client = AuthenticationClient(channel);
  }

  void tryLogout(BuildContext context) async {
    print("Logout revoke");
    callLogout();
    Provider.of<AccountProvider>(context, listen: false).setLogged(false);
    Navigator.of(context).restorablePushNamedAndRemoveUntil(
        Routes.routeName[RouteNamesEnum.Login],
        (Route<dynamic> route) => false);
  }

//////////////////////////Login///////////////////////////
  Future<String> callLogin(String email, String password,
      bool checkedRememberMe, BuildContext context) async {
    if (_client == null) clientAuthInit();
    try {
      /// Make Login Request
      final deviceUniqueId = await deviceHelper.getDeviceInfor();
      final respone = await _client.login(
        LoginRequest()
          ..accountInformation = AccountInformation(
            userEmail: email,
            password: _hashFunction(password),
          )
          ..deviceUniqueId = deviceUniqueId,
        options: CallOptions(timeout: _clientTimeOut),
      );
      //Get Storage Prefs
      final sharedPrefs = await SharedPreferences.getInstance();
      if (checkedRememberMe) {
        final userData = json.encode({
          'token': respone.token,
          'expiry_date': DateTime.now()
              .add(Duration(seconds: respone.expiryTimeSeconds))
              .toIso8601String(),
        });
        sharedPrefs.setString('userData', userData);
      } else {
        sharedPrefs.remove('userData');
      }

      // Get Expirytime And Set token to Instance static
      AccountProvider.instance.setToken(respone.token,
          DateTime.now().add(Duration(seconds: respone.expiryTimeSeconds)));

      Provider.of<AccountProvider>(context, listen: false).setLogged(true);
      return "OK";
    } on GrpcError catch (err) {
      if (err.message == "NEED_VERIFY") return email;
      return err.message;
    }
  }

//////////////////////////Create Account///////////////////////////
  Future<String> createAccount(String email, String password) async {
    if (_client == null) clientAuthInit();
    try {
      //Call Create Account Request
      final respone = await _client.createAccount(
        CreateAccountRequest()
          ..accountInformation = AccountInformation(
            userEmail: email,
            password: _hashFunction(password),
          ),
        options: CallOptions(timeout: _clientTimeOut),
      );
      print("Result Status: ${respone.createStatus}");
      return "OK";
    } on GrpcError catch (err) {
      print("Code: \"${err.codeName}\" & Message: ${err.message}");
      return err.message;
    } catch (err) {
      return err.message;
    }
  }

  //////////////////////////Auto Login///////////////////////////
  Future<String> tryAutoLogin([String token = ""]) async {
    if (_client == null) clientAuthInit();

    final deviceUniqueId = await deviceHelper.getDeviceInfor();
    final sharedPrefs = await SharedPreferences.getInstance();
    var respone;
    //// Request if login call with local storage token and else with token
    if (token.isEmpty)
      try {
        ///Check File UserData
        if (!sharedPrefs.containsKey('userData')) {
          return "Cannot Find Any Data";
        }
        //Get file user data
        final extractedUserData = json.decode(sharedPrefs.getString('userData'))
            as Map<String, dynamic>;
        final expiryDate = DateTime.parse(extractedUserData['expiry_date']);
        print(
          "\nMy token local: " +
              extractedUserData['token'] +
              '\n' +
              expiryDate.toString(),
        );
        //Check date expired

        if (expiryDate.isBefore(DateTime.now())) {
          return "Time Expired! Please Login Again.";
        }
        if (extractedUserData['token'] == null) {
          return '';
        }

        /// AutoLogin Server Request
        respone = await _client.autoLogin(
          AutoLoginRequest()..deviceUniqueId = deviceUniqueId,
          options: CallOptions(
              timeout: _clientTimeOut,
              metadata: {'token': extractedUserData['token']}),
        );
      } on GrpcError catch (err) {
        print("Code: \"${err.codeName}\" & Message: ${err.message}");
        return err.message;
      }
    else {
      try {
        respone = await _client.autoLogin(
          AutoLoginRequest()..deviceUniqueId = deviceUniqueId,
          options:
              CallOptions(timeout: _clientTimeOut, metadata: {'token': token}),
        );
        final userData = json.encode({
          'token': respone.token,
          'expiry_date': DateTime.now()
              .add(Duration(seconds: respone.expiryTimeSeconds))
              .toIso8601String(),
        });
        sharedPrefs.setString('userData', userData);
        AccountProvider.instance.setToken(respone.token,
            DateTime.now().add(Duration(seconds: respone.expiryTimeSeconds)));
      } on GrpcError catch (err) {
        print("Code: \"${err.codeName}\" & Message: ${err.message}");
        return err.message;
      }
    }
    // Store token and Expiry date Again

    final userData = json.encode({
      'token': respone.token,
      'expiry_date': DateTime.now()
          .add(Duration(seconds: respone.expiryTimeSeconds))
          .toIso8601String(),
    });
    sharedPrefs.setString('userData', userData);
    AccountProvider.instance.setToken(respone.token,
        DateTime.now().add(Duration(seconds: respone.expiryTimeSeconds)));

    return "OK";
  }

  //////////////////////////LOGOUT///////////////////////////
  Future<String> callLogout([Future<String> deviceInfor]) async {
    if (_client == null) clientAuthInit();
    ////Logout Request////
    try {
      final deviceInfor = await deviceHelper.getDeviceInfor();
      final respone = await _client.logout(
        LogoutRequest()..deviceUniqueId = deviceInfor,
        options: CallOptions(timeout: _clientTimeOut, metadata: {
          'token': AccountProvider.instance.authInformation.token
        }),
      );
      print(respone);
      return "OK";
    } on GrpcError catch (err) {
      print("Code: \"${err.codeName}\" & Message: ${err.message}");
    } finally {
      AuthInformation(token: '', expiryDate: null);
      final sharedPrefs = await SharedPreferences.getInstance();
      sharedPrefs.remove('userData');
    }
    return "Not authorize";
  }

//////////////////////////Send Email Verification///////////////////////////
  Future<String> sendEmailVerificationRequest(String email) async {
    if (_client == null) clientAuthInit();
    try {
      if (email.isNotEmpty)
        await _client.emailVerification(
          EmailVerificationRequest()..email = email,
          options: CallOptions(timeout: _clientTimeOut),
        );
      else
        return "Send Nothing";
      return "OK";
    } on GrpcError catch (err) {
      print("Code: \"${err.codeName}\" & Message: ${err.message}");
      return err.message;
    } catch (err) {
      return "Something not right!";
    }
  }

//////////////////////////Send code Email Verification///////////////////////////
  Future<String> sendEmailVerificationCodeRequest(
      String email, int code, bool isChangePassword) async {
    if (_client == null) clientAuthInit();
    final deviceId = await deviceHelper.getDeviceInfor();
    try {
      final respone = await _client.emailVerificationCode(
        EmailVerificationCodeRequest()
          ..code = code
          ..email = email
          ..deviceUniqueId = deviceId,
      );
      ///// If  Verify Try Auto Login Else Change Password //////
      if (!isChangePassword)
        tryAutoLogin(respone.token);
      else
        AccountProvider.instance
            .setToken(respone.token, DateTime.now().add(Duration(minutes: 10)));
      return "EMAIL_CONFIRMED";
    } on GrpcError catch (err) {
      print("Code: \"${err.codeName}\" & Message: ${err.message}");
      return err.message;
    } catch (err) {
      return "Something not right!";
    }
  }

//////////////////////////Login///////////////////////////
  Future<String> callForgotPassword(String email) async {
    clientAuthInit();
    try {
      await _client.forgotPassword(
        ForgotPasswordResquest()..email = email,
        options: CallOptions(timeout: _clientTimeOut),
      );
      return "OK";
    } on GrpcError catch (err) {
      print("Code: \"${err.codeName}\" & Message: ${err.message}");
      return err.message;
    } catch (err) {
      return "Something not right!";
    }
  }

//////////////////////////Change Password//////////////////////
  Future<String> changePassword(String password) async {
    clientAuthInit();
    try {
      final respone = await _client.changePassword(
        ChangePasswordResquest()..password = _hashFunction(password),
        options: CallOptions(timeout: _clientTimeOut, metadata: {
          'token': AccountProvider.instance.authInformation.token
        }),
      );
      print("Message: ${_hashFunction(password)}");

      return "PASSWORD_HAS_BEEN_CHANGED";
    } on GrpcError catch (err) {
      print("Code: \"${err.codeName}\" & Message: ${err.message}");
      return err.message;
    } catch (err) {
      return "Something not right!";
    }
  }

  String _hashFunction(String text) {
    return hash.sha512.convert(utf8.encode(text)).toString();
  }
}
