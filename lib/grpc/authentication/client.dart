import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:grpc/grpc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mine_loop_education/grpc/authentication/authenticationpb/authentication.pbgrpc.dart';
import 'package:crypto/crypto.dart' as hash;

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

  Future<String> callLogin(
      String email, String password, bool checkedRememberMe) async {
    if (_client == null) clientChatInit();
    try {
      final respone = await _client.login(
        LoginRequest()
          ..accountInformation = AccountInformation(
            userEmail: email,
            password: _hashFunction(password),
          ),
        options: CallOptions(timeout: _clientTimeOut),
      );
      final sharedPrefs = await SharedPreferences.getInstance();
      if (checkedRememberMe) {
        final userData = json.encode({
          'token': respone.token,
          'expiryDate': DateTime.now()
              .add(Duration(seconds: respone.expiryTimeSeconds))
              .toIso8601String(),
        });
        sharedPrefs.setString('userData', userData);
      } else {
        sharedPrefs.clear();
      }
      print("token: \n" +
          respone.expiryTimeSeconds.toString() +
          "\nexpiry date: " +
          DateTime.now()
              .add(Duration(seconds: respone.expiryTimeSeconds))
              .toIso8601String());
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
      final respone = await _client.createAccount(CreateAccountRequest()
        ..accountInformation = AccountInformation(
          userEmail: email,
          password: _hashFunction(password),
        ));
      print("Result Status: ${respone.createStatus}");
      return "OK";
    } on GrpcError catch (err) {
      print("Code: \"${err.codeName}\" & Message: ${err.message}");
      return err.message;
    } catch (err) {
      return err.message;
    }
  }

  Future<bool> tryAutoLogin() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    if (!sharedPrefs.containsKey('userData')) {
      return false;
    }
    final extractedUserData =
        json.decode(sharedPrefs.getString('userData')) as Map<String, dynamic>;
    final expiryDate = DateTime.parse(extractedUserData['expiryDate']);

    if (expiryDate.isBefore(DateTime.now())) {
      return false;
    }
    print(
      "\nMy token local: " +
          extractedUserData['token'] +
          '\n' +
          expiryDate.toString(),
    );
    return true;
  }

  Future<String> sendEmailVerificationRequest(String email) async {
    if (_client == null) clientChatInit();
    try {
      await _client.emailVerification(
        EmailVerificationRequest()..email = email,
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
