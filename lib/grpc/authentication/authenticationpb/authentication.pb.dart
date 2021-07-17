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

