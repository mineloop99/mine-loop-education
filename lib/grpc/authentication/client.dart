import 'dart:convert';

import 'package:grpc/grpc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:mine_loop_education/grpc/authentication/authenticationpb/authentication.pbgrpc.dart';
import 'package:crypto/crypto.dart' as hash;

const ip = "10.0.2.2";
const port = 50010;

class AuthenticationAPI {
  static AuthenticationAPI instance = AuthenticationAPI();
  static AuthenticationClient client;

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

  Future<void> callLogin() async {
    try {
      final respone = await client.authenticate(AuthenticateRequest()
        ..authenticationInformation = AuthenticationInformation(
          userEmail: "email",
          password: _hashFunction("sance"),
        ));
      final sharedPrefs = await SharedPreferences.getInstance();
      final userData = json.encode({
        'token': respone.token,
        'expiryDate':
            DateTime.now().add(Duration(seconds: respone.expiryTimeSeconds)),
      });
      sharedPrefs.setString('userData', userData);
    } catch (err) {
      throw err;
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
      "My token local: " +
          extractedUserData['token'] +
          "My token local: " +
          extractedUserData['token'] +
          expiryDate.toString(),
    );
    return true;
  }

  String _hashFunction(String text) {
    return hash.sha512.convert(utf8.encode(text)).toString();
  }
}
