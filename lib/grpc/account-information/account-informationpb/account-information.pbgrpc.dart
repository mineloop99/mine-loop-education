///
//  Generated code. Do not modify.
//  source: account-information.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'account-information.pb.dart' as $0;
export 'account-information.pb.dart';

class AccountInformationServiceClient extends $grpc.Client {
  static final _$welcomeMessage =
      $grpc.ClientMethod<$0.WelcomeMessageRequest, $0.WelcomeMessageRespone>(
          '/accountInformation.AccountInformationService/WelcomeMessage',
          ($0.WelcomeMessageRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.WelcomeMessageRespone.fromBuffer(value));
  static final _$fetchUserInformation = $grpc.ClientMethod<
          $0.FetchUserInformationRequest, $0.FetchUserInformationRespone>(
      '/accountInformation.AccountInformationService/FetchUserInformation',
      ($0.FetchUserInformationRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.FetchUserInformationRespone.fromBuffer(value));
  static final _$editUserInformation = $grpc.ClientMethod<
          $0.EditUserInformationRequest, $0.EditUserInformationRespone>(
      '/accountInformation.AccountInformationService/EditUserInformation',
      ($0.EditUserInformationRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.EditUserInformationRespone.fromBuffer(value));

  AccountInformationServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.WelcomeMessageRespone> welcomeMessage(
      $0.WelcomeMessageRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$welcomeMessage, request, options: options);
  }

  $grpc.ResponseFuture<$0.FetchUserInformationRespone> fetchUserInformation(
      $0.FetchUserInformationRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$fetchUserInformation, request, options: options);
  }

  $grpc.ResponseFuture<$0.EditUserInformationRespone> editUserInformation(
      $0.EditUserInformationRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$editUserInformation, request, options: options);
  }
}

abstract class AccountInformationServiceBase extends $grpc.Service {
  $core.String get $name => 'accountInformation.AccountInformationService';

  AccountInformationServiceBase() {
    $addMethod(
        $grpc.ServiceMethod<$0.WelcomeMessageRequest, $0.WelcomeMessageRespone>(
            'WelcomeMessage',
            welcomeMessage_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.WelcomeMessageRequest.fromBuffer(value),
            ($0.WelcomeMessageRespone value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FetchUserInformationRequest,
            $0.FetchUserInformationRespone>(
        'FetchUserInformation',
        fetchUserInformation_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.FetchUserInformationRequest.fromBuffer(value),
        ($0.FetchUserInformationRespone value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.EditUserInformationRequest,
            $0.EditUserInformationRespone>(
        'EditUserInformation',
        editUserInformation_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.EditUserInformationRequest.fromBuffer(value),
        ($0.EditUserInformationRespone value) => value.writeToBuffer()));
  }

  $async.Future<$0.WelcomeMessageRespone> welcomeMessage_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.WelcomeMessageRequest> request) async {
    return welcomeMessage(call, await request);
  }

  $async.Future<$0.FetchUserInformationRespone> fetchUserInformation_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.FetchUserInformationRequest> request) async {
    return fetchUserInformation(call, await request);
  }

  $async.Future<$0.EditUserInformationRespone> editUserInformation_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.EditUserInformationRequest> request) async {
    return editUserInformation(call, await request);
  }

  $async.Future<$0.WelcomeMessageRespone> welcomeMessage(
      $grpc.ServiceCall call, $0.WelcomeMessageRequest request);
  $async.Future<$0.FetchUserInformationRespone> fetchUserInformation(
      $grpc.ServiceCall call, $0.FetchUserInformationRequest request);
  $async.Future<$0.EditUserInformationRespone> editUserInformation(
      $grpc.ServiceCall call, $0.EditUserInformationRequest request);
}
