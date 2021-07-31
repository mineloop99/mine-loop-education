import 'package:flutter/cupertino.dart';
import 'package:grpc/grpc.dart';
import 'package:provider/provider.dart';
import '../../auth/providers/account-provider.dart' show AccountProvider;
import '../../grpc/account-information/account-informationpb/account-information.pbgrpc.dart';
import 'account-informationpb/account-information.pb.dart'
    show AccountInformation;
import '../../home/providers/my-account-provider.dart';

const ip = 'mineloop99.eastasia.cloudapp.azure.com';
const ipLocal = "10.0.2.2";
const isLocal = true;
const port = 50011;

class AccountInformationAPI {
  static AccountInformationAPI instance = AccountInformationAPI();
  AccountInformationServiceClient _client;

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
    _client = AccountInformationServiceClient(channel);
  }

// EDIT USER INFOR
  Future<String> callEditAccountInformation({
    String username,
    DateTime userBirthday,
    String userSex,
    String userPhoneNumber,
  }) async {
    if (_client == null) clientAuthInit();
    try {
      /// Make Login Request
      await _client.editUserInformation(
        EditUserInformationRequest()
          ..accountInformation = AccountInformation(
            userName: username,
            userBirthday: (userBirthday.millisecondsSinceEpoch / 1000).round(),
            userSex: userSex,
            userPhoneNumber: userPhoneNumber,
            userAvatar: '',
            userWallpaper: '',
          ),
        options: CallOptions(timeout: _clientTimeOut, metadata: {
          'token': AccountProvider.instance.authInformation.token
        }),
      );
      return "OK";
    } on GrpcError catch (err) {
      return err.message;
    }
  }

// FETCH USER INFOR
  Future<String> callFetchAccountInformation(BuildContext context) async {
    if (_client == null) clientAuthInit();
    try {
      /// Make Login Request
      final respone = await _client.fetchUserInformation(
        FetchUserInformationRequest(),
        options: CallOptions(timeout: _clientTimeOut, metadata: {
          'token': AccountProvider.instance.authInformation.token
        }),
      );
      final userData = respone.fetchAccountInformation;
      Provider.of<MyAccountProvider>(context, listen: false).setUserInformation(
          userData.userName,
          userData.userPhoneNumber,
          DateTime.fromMillisecondsSinceEpoch(userData.userBirthday * 1000),
          userData.userSex,
          userData.userEmail);
      return "OK";
    } on GrpcError catch (err) {
      return err.message;
    }
  }
}
