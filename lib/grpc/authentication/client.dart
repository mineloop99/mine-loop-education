import 'dart:convert';

import 'package:grpc/grpc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mine_loop_education/grpc/authentication/authenticationpb/authentication.pbgrpc.dart';
import 'package:crypto/crypto.dart' as hash;

const ip = "10.0.2.2";
const port = 50010;

class AuthenticationAPI {
  static AuthenticationAPI instance = AuthenticationAPI();
  AuthenticationClient client;

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
    client = AuthenticationClient(channel);
  }

  Future<String> callLogin(String email, String password) async {
    clientChatInit();
    try {
      final respone = await client.login(
        LoginRequest()
          ..accountInformation = AccountInformation(
            userEmail: email,
            password: _hashFunction(password),
          ),
        options: CallOptions(timeout: _clientTimeOut),
      );
      final sharedPrefs = await SharedPreferences.getInstance();
      final userData = json.encode({
        'token': respone.token,
        'expiryDate': DateTime.now()
            .add(Duration(seconds: respone.expiryTimeSeconds))
            .toIso8601String(),
      });
      sharedPrefs.setString('userData', userData);
      return "OK";
    } on GrpcError catch (err) {
      print("Code: \"${err.codeName}\" & Message: ${err.message}");
      return err.message;
    } catch (err) {
      return err.message;
    }
  }

  Future<String> createAccount(String email, String password) async {
    try {
      final respone = await client.createAccount(CreateAccountRequest()
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

  String _hashFunction(String text) {
    return hash.sha512.convert(utf8.encode(text)).toString();
  }
}
