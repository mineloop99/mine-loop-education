///
//  Generated code. Do not modify.
//  source: authentication.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'authentication.pb.dart' as $0;
export 'authentication.pb.dart';

class AuthenticationClient extends $grpc.Client {
  static final _$login = $grpc.ClientMethod<$0.LoginRequest, $0.LoginRespone>(
      '/authentication.Authentication/Login',
      ($0.LoginRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.LoginRespone.fromBuffer(value));
  static final _$createAccount =
      $grpc.ClientMethod<$0.CreateAccountRequest, $0.CreateAccountRespone>(
          '/authentication.Authentication/CreateAccount',
          ($0.CreateAccountRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.CreateAccountRespone.fromBuffer(value));
  static final _$emailVerification = $grpc.ClientMethod<
          $0.EmailVerificationRequest, $0.EmailVerificationRespone>(
      '/authentication.Authentication/EmailVerification',
      ($0.EmailVerificationRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.EmailVerificationRespone.fromBuffer(value));
  static final _$emailVerificationCode = $grpc.ClientMethod<
          $0.EmailVerificationCodeRequest, $0.EmailVerificationCodeRespone>(
      '/authentication.Authentication/EmailVerificationCode',
      ($0.EmailVerificationCodeRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.EmailVerificationCodeRespone.fromBuffer(value));

  AuthenticationClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.LoginRespone> login($0.LoginRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$login, request, options: options);
  }

  $grpc.ResponseFuture<$0.CreateAccountRespone> createAccount(
      $0.CreateAccountRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createAccount, request, options: options);
  }

  $grpc.ResponseFuture<$0.EmailVerificationRespone> emailVerification(
      $0.EmailVerificationRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$emailVerification, request, options: options);
  }

  $grpc.ResponseFuture<$0.EmailVerificationCodeRespone> emailVerificationCode(
      $0.EmailVerificationCodeRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$emailVerificationCode, request, options: options);
  }
}

abstract class AuthenticationServiceBase extends $grpc.Service {
  $core.String get $name => 'authentication.Authentication';

  AuthenticationServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.LoginRequest, $0.LoginRespone>(
        'Login',
        login_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.LoginRequest.fromBuffer(value),
        ($0.LoginRespone value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.CreateAccountRequest, $0.CreateAccountRespone>(
            'CreateAccount',
            createAccount_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.CreateAccountRequest.fromBuffer(value),
            ($0.CreateAccountRespone value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.EmailVerificationRequest,
            $0.EmailVerificationRespone>(
        'EmailVerification',
        emailVerification_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.EmailVerificationRequest.fromBuffer(value),
        ($0.EmailVerificationRespone value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.EmailVerificationCodeRequest,
            $0.EmailVerificationCodeRespone>(
        'EmailVerificationCode',
        emailVerificationCode_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.EmailVerificationCodeRequest.fromBuffer(value),
        ($0.EmailVerificationCodeRespone value) => value.writeToBuffer()));
  }

  $async.Future<$0.LoginRespone> login_Pre(
      $grpc.ServiceCall call, $async.Future<$0.LoginRequest> request) async {
    return login(call, await request);
  }

  $async.Future<$0.CreateAccountRespone> createAccount_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.CreateAccountRequest> request) async {
    return createAccount(call, await request);
  }

  $async.Future<$0.EmailVerificationRespone> emailVerification_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.EmailVerificationRequest> request) async {
    return emailVerification(call, await request);
  }

  $async.Future<$0.EmailVerificationCodeRespone> emailVerificationCode_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.EmailVerificationCodeRequest> request) async {
    return emailVerificationCode(call, await request);
  }

  $async.Future<$0.LoginRespone> login(
      $grpc.ServiceCall call, $0.LoginRequest request);
  $async.Future<$0.CreateAccountRespone> createAccount(
      $grpc.ServiceCall call, $0.CreateAccountRequest request);
  $async.Future<$0.EmailVerificationRespone> emailVerification(
      $grpc.ServiceCall call, $0.EmailVerificationRequest request);
  $async.Future<$0.EmailVerificationCodeRespone> emailVerificationCode(
      $grpc.ServiceCall call, $0.EmailVerificationCodeRequest request);
}
