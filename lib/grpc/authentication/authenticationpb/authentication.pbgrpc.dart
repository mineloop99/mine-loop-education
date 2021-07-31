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

class AuthenticationServicesClient extends $grpc.Client {
  static final _$testing =
      $grpc.ClientMethod<$0.TestingRequest, $0.TestingRespone>(
          '/authentication.AuthenticationServices/Testing',
          ($0.TestingRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.TestingRespone.fromBuffer(value));
  static final _$login = $grpc.ClientMethod<$0.LoginRequest, $0.LoginRespone>(
      '/authentication.AuthenticationServices/Login',
      ($0.LoginRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.LoginRespone.fromBuffer(value));
  static final _$autoLogin =
      $grpc.ClientMethod<$0.AutoLoginRequest, $0.AutoLoginRespone>(
          '/authentication.AuthenticationServices/AutoLogin',
          ($0.AutoLoginRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.AutoLoginRespone.fromBuffer(value));
  static final _$logout =
      $grpc.ClientMethod<$0.LogoutRequest, $0.LougoutRespone>(
          '/authentication.AuthenticationServices/Logout',
          ($0.LogoutRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.LougoutRespone.fromBuffer(value));
  static final _$createAccount =
      $grpc.ClientMethod<$0.CreateAccountRequest, $0.CreateAccountRespone>(
          '/authentication.AuthenticationServices/CreateAccount',
          ($0.CreateAccountRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.CreateAccountRespone.fromBuffer(value));
  static final _$emailVerification = $grpc.ClientMethod<
          $0.EmailVerificationRequest, $0.EmailVerificationRespone>(
      '/authentication.AuthenticationServices/EmailVerification',
      ($0.EmailVerificationRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.EmailVerificationRespone.fromBuffer(value));
  static final _$emailVerificationCode = $grpc.ClientMethod<
          $0.EmailVerificationCodeRequest, $0.EmailVerificationCodeRespone>(
      '/authentication.AuthenticationServices/EmailVerificationCode',
      ($0.EmailVerificationCodeRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.EmailVerificationCodeRespone.fromBuffer(value));
  static final _$forgotPassword =
      $grpc.ClientMethod<$0.ForgotPasswordResquest, $0.ForgotPasswordRespone>(
          '/authentication.AuthenticationServices/ForgotPassword',
          ($0.ForgotPasswordResquest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ForgotPasswordRespone.fromBuffer(value));
  static final _$changePassword =
      $grpc.ClientMethod<$0.ChangePasswordResquest, $0.ChangePasswordRespone>(
          '/authentication.AuthenticationServices/ChangePassword',
          ($0.ChangePasswordResquest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ChangePasswordRespone.fromBuffer(value));
  static final _$authorization =
      $grpc.ClientMethod<$0.AuthorizationRequest, $0.AuthorizationRespone>(
          '/authentication.AuthenticationServices/Authorization',
          ($0.AuthorizationRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.AuthorizationRespone.fromBuffer(value));
  static final _$changePasswordWithOldPassword = $grpc.ClientMethod<
          $0.ChangePasswordWithOldPasswordRequest,
          $0.ChangePasswordWithOldPasswordRespone>(
      '/authentication.AuthenticationServices/ChangePasswordWithOldPassword',
      ($0.ChangePasswordWithOldPasswordRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.ChangePasswordWithOldPasswordRespone.fromBuffer(value));

  AuthenticationServicesClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.TestingRespone> testing($0.TestingRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$testing, request, options: options);
  }

  $grpc.ResponseFuture<$0.LoginRespone> login($0.LoginRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$login, request, options: options);
  }

  $grpc.ResponseFuture<$0.AutoLoginRespone> autoLogin(
      $0.AutoLoginRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$autoLogin, request, options: options);
  }

  $grpc.ResponseFuture<$0.LougoutRespone> logout($0.LogoutRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$logout, request, options: options);
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

  $grpc.ResponseFuture<$0.ForgotPasswordRespone> forgotPassword(
      $0.ForgotPasswordResquest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$forgotPassword, request, options: options);
  }

  $grpc.ResponseFuture<$0.ChangePasswordRespone> changePassword(
      $0.ChangePasswordResquest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$changePassword, request, options: options);
  }

  $grpc.ResponseFuture<$0.AuthorizationRespone> authorization(
      $0.AuthorizationRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$authorization, request, options: options);
  }

  $grpc.ResponseFuture<$0.ChangePasswordWithOldPasswordRespone>
      changePasswordWithOldPassword(
          $0.ChangePasswordWithOldPasswordRequest request,
          {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$changePasswordWithOldPassword, request,
        options: options);
  }
}

abstract class AuthenticationServicesServiceBase extends $grpc.Service {
  $core.String get $name => 'authentication.AuthenticationServices';

  AuthenticationServicesServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.TestingRequest, $0.TestingRespone>(
        'Testing',
        testing_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.TestingRequest.fromBuffer(value),
        ($0.TestingRespone value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.LoginRequest, $0.LoginRespone>(
        'Login',
        login_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.LoginRequest.fromBuffer(value),
        ($0.LoginRespone value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.AutoLoginRequest, $0.AutoLoginRespone>(
        'AutoLogin',
        autoLogin_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AutoLoginRequest.fromBuffer(value),
        ($0.AutoLoginRespone value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.LogoutRequest, $0.LougoutRespone>(
        'Logout',
        logout_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.LogoutRequest.fromBuffer(value),
        ($0.LougoutRespone value) => value.writeToBuffer()));
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
    $addMethod($grpc.ServiceMethod<$0.ForgotPasswordResquest,
            $0.ForgotPasswordRespone>(
        'ForgotPassword',
        forgotPassword_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ForgotPasswordResquest.fromBuffer(value),
        ($0.ForgotPasswordRespone value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ChangePasswordResquest,
            $0.ChangePasswordRespone>(
        'ChangePassword',
        changePassword_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ChangePasswordResquest.fromBuffer(value),
        ($0.ChangePasswordRespone value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.AuthorizationRequest, $0.AuthorizationRespone>(
            'Authorization',
            authorization_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.AuthorizationRequest.fromBuffer(value),
            ($0.AuthorizationRespone value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ChangePasswordWithOldPasswordRequest,
            $0.ChangePasswordWithOldPasswordRespone>(
        'ChangePasswordWithOldPassword',
        changePasswordWithOldPassword_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ChangePasswordWithOldPasswordRequest.fromBuffer(value),
        ($0.ChangePasswordWithOldPasswordRespone value) =>
            value.writeToBuffer()));
  }

  $async.Future<$0.TestingRespone> testing_Pre(
      $grpc.ServiceCall call, $async.Future<$0.TestingRequest> request) async {
    return testing(call, await request);
  }

  $async.Future<$0.LoginRespone> login_Pre(
      $grpc.ServiceCall call, $async.Future<$0.LoginRequest> request) async {
    return login(call, await request);
  }

  $async.Future<$0.AutoLoginRespone> autoLogin_Pre($grpc.ServiceCall call,
      $async.Future<$0.AutoLoginRequest> request) async {
    return autoLogin(call, await request);
  }

  $async.Future<$0.LougoutRespone> logout_Pre(
      $grpc.ServiceCall call, $async.Future<$0.LogoutRequest> request) async {
    return logout(call, await request);
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

  $async.Future<$0.ForgotPasswordRespone> forgotPassword_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.ForgotPasswordResquest> request) async {
    return forgotPassword(call, await request);
  }

  $async.Future<$0.ChangePasswordRespone> changePassword_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.ChangePasswordResquest> request) async {
    return changePassword(call, await request);
  }

  $async.Future<$0.AuthorizationRespone> authorization_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.AuthorizationRequest> request) async {
    return authorization(call, await request);
  }

  $async.Future<$0.ChangePasswordWithOldPasswordRespone>
      changePasswordWithOldPassword_Pre(
          $grpc.ServiceCall call,
          $async.Future<$0.ChangePasswordWithOldPasswordRequest>
              request) async {
    return changePasswordWithOldPassword(call, await request);
  }

  $async.Future<$0.TestingRespone> testing(
      $grpc.ServiceCall call, $0.TestingRequest request);
  $async.Future<$0.LoginRespone> login(
      $grpc.ServiceCall call, $0.LoginRequest request);
  $async.Future<$0.AutoLoginRespone> autoLogin(
      $grpc.ServiceCall call, $0.AutoLoginRequest request);
  $async.Future<$0.LougoutRespone> logout(
      $grpc.ServiceCall call, $0.LogoutRequest request);
  $async.Future<$0.CreateAccountRespone> createAccount(
      $grpc.ServiceCall call, $0.CreateAccountRequest request);
  $async.Future<$0.EmailVerificationRespone> emailVerification(
      $grpc.ServiceCall call, $0.EmailVerificationRequest request);
  $async.Future<$0.EmailVerificationCodeRespone> emailVerificationCode(
      $grpc.ServiceCall call, $0.EmailVerificationCodeRequest request);
  $async.Future<$0.ForgotPasswordRespone> forgotPassword(
      $grpc.ServiceCall call, $0.ForgotPasswordResquest request);
  $async.Future<$0.ChangePasswordRespone> changePassword(
      $grpc.ServiceCall call, $0.ChangePasswordResquest request);
  $async.Future<$0.AuthorizationRespone> authorization(
      $grpc.ServiceCall call, $0.AuthorizationRequest request);
  $async.Future<$0.ChangePasswordWithOldPasswordRespone>
      changePasswordWithOldPassword($grpc.ServiceCall call,
          $0.ChangePasswordWithOldPasswordRequest request);
}
