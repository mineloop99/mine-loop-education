///
//  Generated code. Do not modify.
//  source: authentication.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class AccountInformation extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AccountInformation', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'authentication'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userEmail')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'password')
    ..hasRequiredFields = false
  ;

  AccountInformation._() : super();
  factory AccountInformation({
    $core.String? userEmail,
    $core.String? password,
  }) {
    final _result = create();
    if (userEmail != null) {
      _result.userEmail = userEmail;
    }
    if (password != null) {
      _result.password = password;
    }
    return _result;
  }
  factory AccountInformation.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AccountInformation.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AccountInformation clone() => AccountInformation()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AccountInformation copyWith(void Function(AccountInformation) updates) => super.copyWith((message) => updates(message as AccountInformation)) as AccountInformation; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AccountInformation create() => AccountInformation._();
  AccountInformation createEmptyInstance() => create();
  static $pb.PbList<AccountInformation> createRepeated() => $pb.PbList<AccountInformation>();
  @$core.pragma('dart2js:noInline')
  static AccountInformation getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AccountInformation>(create);
  static AccountInformation? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userEmail => $_getSZ(0);
  @$pb.TagNumber(1)
  set userEmail($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserEmail() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(2)
  set password($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassword() => clearField(2);
}

class LoginRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LoginRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'authentication'), createEmptyInstance: create)
    ..aOM<AccountInformation>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'accountInformation', subBuilder: AccountInformation.create)
    ..hasRequiredFields = false
  ;

  LoginRequest._() : super();
  factory LoginRequest({
    AccountInformation? accountInformation,
  }) {
    final _result = create();
    if (accountInformation != null) {
      _result.accountInformation = accountInformation;
    }
    return _result;
  }
  factory LoginRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LoginRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LoginRequest clone() => LoginRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LoginRequest copyWith(void Function(LoginRequest) updates) => super.copyWith((message) => updates(message as LoginRequest)) as LoginRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LoginRequest create() => LoginRequest._();
  LoginRequest createEmptyInstance() => create();
  static $pb.PbList<LoginRequest> createRepeated() => $pb.PbList<LoginRequest>();
  @$core.pragma('dart2js:noInline')
  static LoginRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LoginRequest>(create);
  static LoginRequest? _defaultInstance;

  @$pb.TagNumber(1)
  AccountInformation get accountInformation => $_getN(0);
  @$pb.TagNumber(1)
  set accountInformation(AccountInformation v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccountInformation() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccountInformation() => clearField(1);
  @$pb.TagNumber(1)
  AccountInformation ensureAccountInformation() => $_ensure(0);
}

class LoginRespone extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LoginRespone', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'authentication'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'token')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'expiryTimeSeconds', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  LoginRespone._() : super();
  factory LoginRespone({
    $core.String? token,
    $core.int? expiryTimeSeconds,
  }) {
    final _result = create();
    if (token != null) {
      _result.token = token;
    }
    if (expiryTimeSeconds != null) {
      _result.expiryTimeSeconds = expiryTimeSeconds;
    }
    return _result;
  }
  factory LoginRespone.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LoginRespone.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LoginRespone clone() => LoginRespone()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LoginRespone copyWith(void Function(LoginRespone) updates) => super.copyWith((message) => updates(message as LoginRespone)) as LoginRespone; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LoginRespone create() => LoginRespone._();
  LoginRespone createEmptyInstance() => create();
  static $pb.PbList<LoginRespone> createRepeated() => $pb.PbList<LoginRespone>();
  @$core.pragma('dart2js:noInline')
  static LoginRespone getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LoginRespone>(create);
  static LoginRespone? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get token => $_getSZ(0);
  @$pb.TagNumber(1)
  set token($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearToken() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get expiryTimeSeconds => $_getIZ(1);
  @$pb.TagNumber(2)
  set expiryTimeSeconds($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasExpiryTimeSeconds() => $_has(1);
  @$pb.TagNumber(2)
  void clearExpiryTimeSeconds() => clearField(2);
}

class CreateAccountRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateAccountRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'authentication'), createEmptyInstance: create)
    ..aOM<AccountInformation>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'accountInformation', subBuilder: AccountInformation.create)
    ..hasRequiredFields = false
  ;

  CreateAccountRequest._() : super();
  factory CreateAccountRequest({
    AccountInformation? accountInformation,
  }) {
    final _result = create();
    if (accountInformation != null) {
      _result.accountInformation = accountInformation;
    }
    return _result;
  }
  factory CreateAccountRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateAccountRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateAccountRequest clone() => CreateAccountRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateAccountRequest copyWith(void Function(CreateAccountRequest) updates) => super.copyWith((message) => updates(message as CreateAccountRequest)) as CreateAccountRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateAccountRequest create() => CreateAccountRequest._();
  CreateAccountRequest createEmptyInstance() => create();
  static $pb.PbList<CreateAccountRequest> createRepeated() => $pb.PbList<CreateAccountRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateAccountRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateAccountRequest>(create);
  static CreateAccountRequest? _defaultInstance;

  @$pb.TagNumber(1)
  AccountInformation get accountInformation => $_getN(0);
  @$pb.TagNumber(1)
  set accountInformation(AccountInformation v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccountInformation() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccountInformation() => clearField(1);
  @$pb.TagNumber(1)
  AccountInformation ensureAccountInformation() => $_ensure(0);
}

class CreateAccountRespone extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateAccountRespone', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'authentication'), createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createStatus')
    ..hasRequiredFields = false
  ;

  CreateAccountRespone._() : super();
  factory CreateAccountRespone({
    $core.bool? createStatus,
  }) {
    final _result = create();
    if (createStatus != null) {
      _result.createStatus = createStatus;
    }
    return _result;
  }
  factory CreateAccountRespone.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateAccountRespone.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateAccountRespone clone() => CreateAccountRespone()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateAccountRespone copyWith(void Function(CreateAccountRespone) updates) => super.copyWith((message) => updates(message as CreateAccountRespone)) as CreateAccountRespone; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateAccountRespone create() => CreateAccountRespone._();
  CreateAccountRespone createEmptyInstance() => create();
  static $pb.PbList<CreateAccountRespone> createRepeated() => $pb.PbList<CreateAccountRespone>();
  @$core.pragma('dart2js:noInline')
  static CreateAccountRespone getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateAccountRespone>(create);
  static CreateAccountRespone? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get createStatus => $_getBF(0);
  @$pb.TagNumber(1)
  set createStatus($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCreateStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearCreateStatus() => clearField(1);
}

class EmailVerificationRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'EmailVerificationRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'authentication'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..hasRequiredFields = false
  ;

  EmailVerificationRequest._() : super();
  factory EmailVerificationRequest({
    $core.String? email,
  }) {
    final _result = create();
    if (email != null) {
      _result.email = email;
    }
    return _result;
  }
  factory EmailVerificationRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EmailVerificationRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EmailVerificationRequest clone() => EmailVerificationRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EmailVerificationRequest copyWith(void Function(EmailVerificationRequest) updates) => super.copyWith((message) => updates(message as EmailVerificationRequest)) as EmailVerificationRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EmailVerificationRequest create() => EmailVerificationRequest._();
  EmailVerificationRequest createEmptyInstance() => create();
  static $pb.PbList<EmailVerificationRequest> createRepeated() => $pb.PbList<EmailVerificationRequest>();
  @$core.pragma('dart2js:noInline')
  static EmailVerificationRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EmailVerificationRequest>(create);
  static EmailVerificationRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get email => $_getSZ(0);
  @$pb.TagNumber(1)
  set email($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmail() => clearField(1);
}

class EmailVerificationRespone extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'EmailVerificationRespone', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'authentication'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  EmailVerificationRespone._() : super();
  factory EmailVerificationRespone() => create();
  factory EmailVerificationRespone.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EmailVerificationRespone.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EmailVerificationRespone clone() => EmailVerificationRespone()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EmailVerificationRespone copyWith(void Function(EmailVerificationRespone) updates) => super.copyWith((message) => updates(message as EmailVerificationRespone)) as EmailVerificationRespone; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EmailVerificationRespone create() => EmailVerificationRespone._();
  EmailVerificationRespone createEmptyInstance() => create();
  static $pb.PbList<EmailVerificationRespone> createRepeated() => $pb.PbList<EmailVerificationRespone>();
  @$core.pragma('dart2js:noInline')
  static EmailVerificationRespone getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EmailVerificationRespone>(create);
  static EmailVerificationRespone? _defaultInstance;
}

class EmailVerificationCodeRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'EmailVerificationCodeRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'authentication'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'code', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  EmailVerificationCodeRequest._() : super();
  factory EmailVerificationCodeRequest({
    $core.String? email,
    $core.int? code,
  }) {
    final _result = create();
    if (email != null) {
      _result.email = email;
    }
    if (code != null) {
      _result.code = code;
    }
    return _result;
  }
  factory EmailVerificationCodeRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EmailVerificationCodeRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EmailVerificationCodeRequest clone() => EmailVerificationCodeRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EmailVerificationCodeRequest copyWith(void Function(EmailVerificationCodeRequest) updates) => super.copyWith((message) => updates(message as EmailVerificationCodeRequest)) as EmailVerificationCodeRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EmailVerificationCodeRequest create() => EmailVerificationCodeRequest._();
  EmailVerificationCodeRequest createEmptyInstance() => create();
  static $pb.PbList<EmailVerificationCodeRequest> createRepeated() => $pb.PbList<EmailVerificationCodeRequest>();
  @$core.pragma('dart2js:noInline')
  static EmailVerificationCodeRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EmailVerificationCodeRequest>(create);
  static EmailVerificationCodeRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get email => $_getSZ(0);
  @$pb.TagNumber(1)
  set email($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmail() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get code => $_getIZ(1);
  @$pb.TagNumber(2)
  set code($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearCode() => clearField(2);
}

class EmailVerificationCodeRespone extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'EmailVerificationCodeRespone', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'authentication'), createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'verifyStatus')
    ..hasRequiredFields = false
  ;

  EmailVerificationCodeRespone._() : super();
  factory EmailVerificationCodeRespone({
    $core.bool? verifyStatus,
  }) {
    final _result = create();
    if (verifyStatus != null) {
      _result.verifyStatus = verifyStatus;
    }
    return _result;
  }
  factory EmailVerificationCodeRespone.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EmailVerificationCodeRespone.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EmailVerificationCodeRespone clone() => EmailVerificationCodeRespone()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EmailVerificationCodeRespone copyWith(void Function(EmailVerificationCodeRespone) updates) => super.copyWith((message) => updates(message as EmailVerificationCodeRespone)) as EmailVerificationCodeRespone; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EmailVerificationCodeRespone create() => EmailVerificationCodeRespone._();
  EmailVerificationCodeRespone createEmptyInstance() => create();
  static $pb.PbList<EmailVerificationCodeRespone> createRepeated() => $pb.PbList<EmailVerificationCodeRespone>();
  @$core.pragma('dart2js:noInline')
  static EmailVerificationCodeRespone getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EmailVerificationCodeRespone>(create);
  static EmailVerificationCodeRespone? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get verifyStatus => $_getBF(0);
  @$pb.TagNumber(1)
  set verifyStatus($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasVerifyStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearVerifyStatus() => clearField(1);
}

