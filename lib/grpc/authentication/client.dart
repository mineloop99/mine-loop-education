import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:grpc/grpc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:crypto/crypto.dart' as hash;

import '../../auth/providers/account-provider.dart';
import '../../grpc/authentication/authenticationpb/authentication.pbgrpc.dart';
import '../../helpers/device-helper.dart' as deviceHelper;

const ip = "10.0.2.2";
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

  void clientChatInit() {
    final channel = ClientChannel(
      ip,
      port: port,
      options: ChannelOptions(
        credentials: ChannelCredentials.insecure(),
        idleTimeout: Duration(seconds: 10),
      ),
    );
    _client = AuthenticationClient(channel);
  }

  Future<String> testing() async {
    if (_client == null) clientChatInit();
    try {
      final sharedPrefs = await SharedPreferences.getInstance();
      if (!sharedPrefs.containsKey('userData')) {
        return "nothing to read";
      }
      final extractedUserData = json.decode(sharedPrefs.getString('userData'))
          as Map<String, dynamic>;
      if (extractedUserData.isEmpty) return "Can't see any Data in local!";
      print("metadata: $extractedUserData");
      final respone = await _client.testing(
        TestingRequest(),
        options: CallOptions(
            timeout: _clientTimeOut,
            metadata: {'token': extractedUserData['token']}),
      );
      if (respone == null) return "Can not retreiving data from server!";

      return "OK";
    } on GrpcError catch (err) {
      print("Code: \"${err.codeName}\" & Message: ${err.message}");
      return err.message;
    } catch (err) {
      return err.message;
    }
  }

  Future<String> callLogin(
      String email, String password, bool checkedRememberMe) async {
    if (_client == null) clientChatInit();
    try {
      /// Make Login Request
      final respone = await _client.login(
        LoginRequest()
          ..accountInformation = AccountInformation(
            userEmail: email,
            password: _hashFunction(password),
          ),
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
      return "OK";
    } on GrpcError catch (err) {
      print("Code: \"${err.codeName}\" & Message: ${err.message}");
      return err.message;
    } catch (err) {
      return err.message;
    }
  }

  Future<String> createAccount(String email, String password) async {
    if (_client == null) clientChatInit();
    try {
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

  Future<String> tryAutoLogin() async {
    if (_client == null) clientChatInit();
    try {
      ///Check File UserData
      final sharedPrefs = await SharedPreferences.getInstance();
      if (!sharedPrefs.containsKey('userData')) {
        return "Cannot Find Any Data";
      }

      //Get file user data
      final extractedUserData = json.decode(sharedPrefs.getString('userData'))
          as Map<String, dynamic>;
      final expiryDate = DateTime.parse(extractedUserData['expiry_date']);

      //Check date expired
      if (expiryDate.isBefore(DateTime.now())) {
        return "Time Expired! Please Login Again.";
      }
      final deviceUniqueId = await deviceHelper.getDeviceInfor();

      /// AutoLogin Server Request
      final respone = await _client.autoLogin(
        AutoLoginRequest()..deviceUniqueId = deviceUniqueId,
        options: CallOptions(
            timeout: _clientTimeOut,
            metadata: {'token': extractedUserData['token']}),
      );

      // Store token and Expiry date Again

      final userData = json.encode({
        'token': respone.token,
        'expiry_date': DateTime.now()
            .add(Duration(seconds: respone.expiryTimeSeconds))
            .toIso8601String(),
      });
      sharedPrefs.setString('userData', userData);

      print("Result Status: ${respone.token}");
      print(
        "\nMy token local: " +
            extractedUserData['token'] +
            '\n' +
            expiryDate.toString(),
      );
      return "OK";
    } on GrpcError catch (err) {
      print("Code: \"${err.codeName}\" & Message: ${err.message}");
      return err.message;
    } catch (err) {
      return err.message;
    }
  }

  Future<String> sendEmailVerificationRequest(String email) async {
    if (_client == null) clientChatInit();
    try {
      await _client.emailVerification(
        EmailVerificationRequest()..email = email,
        options: CallOptions(timeout: _clientTimeOut),
      );
      return "Email has been sent";
    } on GrpcError catch (err) {
      print("Code: \"${err.codeName}\" & Message: ${err.message}");
      return err.message;
    } catch (err) {
      return err.message;
    }
  }

  Future<String> sendEmailVerificationCodeRequest(
      String email, int code) async {
    if (_client == null) clientChatInit();
    try {
      await _client.emailVerificationCode(
        EmailVerificationCodeRequest()
          ..code = code
          ..email = email,
      );
      return "Email confirmed";
    } on GrpcError catch (err) {
      print("Code: \"${err.codeName}\" & Message: ${err.message}");
      return err.message;
    } catch (err) {
      return err.message;
    }
  }

  String _hashFunction(String text) {
    return hash.sha512.convert(utf8.encode(text)).toString();
  }
}
