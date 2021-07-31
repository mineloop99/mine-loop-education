///
//  Generated code. Do not modify.
//  source: account-information.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class AccountInformation extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AccountInformation', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'accountInformation'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userName')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userBirthday', $pb.PbFieldType.O3)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userSex')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userPhoneNumber')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userAvatar')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userWallpaper')
    ..hasRequiredFields = false
  ;

  AccountInformation._() : super();
  factory AccountInformation({
    $core.String? userName,
    $core.int? userBirthday,
    $core.String? userSex,
    $core.String? userPhoneNumber,
    $core.String? userAvatar,
    $core.String? userWallpaper,
  }) {
    final _result = create();
    if (userName != null) {
      _result.userName = userName;
    }
    if (userBirthday != null) {
      _result.userBirthday = userBirthday;
    }
    if (userSex != null) {
      _result.userSex = userSex;
    }
    if (userPhoneNumber != null) {
      _result.userPhoneNumber = userPhoneNumber;
    }
    if (userAvatar != null) {
      _result.userAvatar = userAvatar;
    }
    if (userWallpaper != null) {
      _result.userWallpaper = userWallpaper;
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
  $core.String get userName => $_getSZ(0);
  @$pb.TagNumber(1)
  set userName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserName() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserName() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get userBirthday => $_getIZ(1);
  @$pb.TagNumber(2)
  set userBirthday($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserBirthday() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserBirthday() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get userSex => $_getSZ(2);
  @$pb.TagNumber(3)
  set userSex($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUserSex() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserSex() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get userPhoneNumber => $_getSZ(3);
  @$pb.TagNumber(4)
  set userPhoneNumber($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasUserPhoneNumber() => $_has(3);
  @$pb.TagNumber(4)
  void clearUserPhoneNumber() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get userAvatar => $_getSZ(4);
  @$pb.TagNumber(5)
  set userAvatar($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasUserAvatar() => $_has(4);
  @$pb.TagNumber(5)
  void clearUserAvatar() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get userWallpaper => $_getSZ(5);
  @$pb.TagNumber(6)
  set userWallpaper($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasUserWallpaper() => $_has(5);
  @$pb.TagNumber(6)
  void clearUserWallpaper() => clearField(6);
}

class FetchAccountInformation extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FetchAccountInformation', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'accountInformation'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userName')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userBirthday', $pb.PbFieldType.O3)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userSex')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userPhoneNumber')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userEmail')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userAvatar')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userWallpaper')
    ..hasRequiredFields = false
  ;

  FetchAccountInformation._() : super();
  factory FetchAccountInformation({
    $core.String? userName,
    $core.int? userBirthday,
    $core.String? userSex,
    $core.String? userPhoneNumber,
    $core.String? userEmail,
    $core.String? userAvatar,
    $core.String? userWallpaper,
  }) {
    final _result = create();
    if (userName != null) {
      _result.userName = userName;
    }
    if (userBirthday != null) {
      _result.userBirthday = userBirthday;
    }
    if (userSex != null) {
      _result.userSex = userSex;
    }
    if (userPhoneNumber != null) {
      _result.userPhoneNumber = userPhoneNumber;
    }
    if (userEmail != null) {
      _result.userEmail = userEmail;
    }
    if (userAvatar != null) {
      _result.userAvatar = userAvatar;
    }
    if (userWallpaper != null) {
      _result.userWallpaper = userWallpaper;
    }
    return _result;
  }
  factory FetchAccountInformation.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchAccountInformation.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchAccountInformation clone() => FetchAccountInformation()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchAccountInformation copyWith(void Function(FetchAccountInformation) updates) => super.copyWith((message) => updates(message as FetchAccountInformation)) as FetchAccountInformation; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchAccountInformation create() => FetchAccountInformation._();
  FetchAccountInformation createEmptyInstance() => create();
  static $pb.PbList<FetchAccountInformation> createRepeated() => $pb.PbList<FetchAccountInformation>();
  @$core.pragma('dart2js:noInline')
  static FetchAccountInformation getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchAccountInformation>(create);
  static FetchAccountInformation? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userName => $_getSZ(0);
  @$pb.TagNumber(1)
  set userName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserName() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserName() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get userBirthday => $_getIZ(1);
  @$pb.TagNumber(2)
  set userBirthday($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserBirthday() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserBirthday() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get userSex => $_getSZ(2);
  @$pb.TagNumber(3)
  set userSex($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUserSex() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserSex() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get userPhoneNumber => $_getSZ(3);
  @$pb.TagNumber(4)
  set userPhoneNumber($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasUserPhoneNumber() => $_has(3);
  @$pb.TagNumber(4)
  void clearUserPhoneNumber() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get userEmail => $_getSZ(4);
  @$pb.TagNumber(5)
  set userEmail($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasUserEmail() => $_has(4);
  @$pb.TagNumber(5)
  void clearUserEmail() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get userAvatar => $_getSZ(5);
  @$pb.TagNumber(6)
  set userAvatar($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasUserAvatar() => $_has(5);
  @$pb.TagNumber(6)
  void clearUserAvatar() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get userWallpaper => $_getSZ(6);
  @$pb.TagNumber(7)
  set userWallpaper($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasUserWallpaper() => $_has(6);
  @$pb.TagNumber(7)
  void clearUserWallpaper() => clearField(7);
}

class WelcomeMessageRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'WelcomeMessageRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'accountInformation'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  WelcomeMessageRequest._() : super();
  factory WelcomeMessageRequest() => create();
  factory WelcomeMessageRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WelcomeMessageRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  WelcomeMessageRequest clone() => WelcomeMessageRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  WelcomeMessageRequest copyWith(void Function(WelcomeMessageRequest) updates) => super.copyWith((message) => updates(message as WelcomeMessageRequest)) as WelcomeMessageRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static WelcomeMessageRequest create() => WelcomeMessageRequest._();
  WelcomeMessageRequest createEmptyInstance() => create();
  static $pb.PbList<WelcomeMessageRequest> createRepeated() => $pb.PbList<WelcomeMessageRequest>();
  @$core.pragma('dart2js:noInline')
  static WelcomeMessageRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WelcomeMessageRequest>(create);
  static WelcomeMessageRequest? _defaultInstance;
}

class WelcomeMessageRespone extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'WelcomeMessageRespone', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'accountInformation'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'welcomeMessage')
    ..hasRequiredFields = false
  ;

  WelcomeMessageRespone._() : super();
  factory WelcomeMessageRespone({
    $core.String? welcomeMessage,
  }) {
    final _result = create();
    if (welcomeMessage != null) {
      _result.welcomeMessage = welcomeMessage;
    }
    return _result;
  }
  factory WelcomeMessageRespone.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WelcomeMessageRespone.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  WelcomeMessageRespone clone() => WelcomeMessageRespone()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  WelcomeMessageRespone copyWith(void Function(WelcomeMessageRespone) updates) => super.copyWith((message) => updates(message as WelcomeMessageRespone)) as WelcomeMessageRespone; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static WelcomeMessageRespone create() => WelcomeMessageRespone._();
  WelcomeMessageRespone createEmptyInstance() => create();
  static $pb.PbList<WelcomeMessageRespone> createRepeated() => $pb.PbList<WelcomeMessageRespone>();
  @$core.pragma('dart2js:noInline')
  static WelcomeMessageRespone getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WelcomeMessageRespone>(create);
  static WelcomeMessageRespone? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get welcomeMessage => $_getSZ(0);
  @$pb.TagNumber(1)
  set welcomeMessage($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasWelcomeMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearWelcomeMessage() => clearField(1);
}

class FetchUserInformationRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FetchUserInformationRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'accountInformation'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  FetchUserInformationRequest._() : super();
  factory FetchUserInformationRequest() => create();
  factory FetchUserInformationRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchUserInformationRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchUserInformationRequest clone() => FetchUserInformationRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchUserInformationRequest copyWith(void Function(FetchUserInformationRequest) updates) => super.copyWith((message) => updates(message as FetchUserInformationRequest)) as FetchUserInformationRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchUserInformationRequest create() => FetchUserInformationRequest._();
  FetchUserInformationRequest createEmptyInstance() => create();
  static $pb.PbList<FetchUserInformationRequest> createRepeated() => $pb.PbList<FetchUserInformationRequest>();
  @$core.pragma('dart2js:noInline')
  static FetchUserInformationRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchUserInformationRequest>(create);
  static FetchUserInformationRequest? _defaultInstance;
}

class FetchUserInformationRespone extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FetchUserInformationRespone', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'accountInformation'), createEmptyInstance: create)
    ..aOM<FetchAccountInformation>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fetchAccountInformation', subBuilder: FetchAccountInformation.create)
    ..hasRequiredFields = false
  ;

  FetchUserInformationRespone._() : super();
  factory FetchUserInformationRespone({
    FetchAccountInformation? fetchAccountInformation,
  }) {
    final _result = create();
    if (fetchAccountInformation != null) {
      _result.fetchAccountInformation = fetchAccountInformation;
    }
    return _result;
  }
  factory FetchUserInformationRespone.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchUserInformationRespone.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchUserInformationRespone clone() => FetchUserInformationRespone()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchUserInformationRespone copyWith(void Function(FetchUserInformationRespone) updates) => super.copyWith((message) => updates(message as FetchUserInformationRespone)) as FetchUserInformationRespone; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchUserInformationRespone create() => FetchUserInformationRespone._();
  FetchUserInformationRespone createEmptyInstance() => create();
  static $pb.PbList<FetchUserInformationRespone> createRepeated() => $pb.PbList<FetchUserInformationRespone>();
  @$core.pragma('dart2js:noInline')
  static FetchUserInformationRespone getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchUserInformationRespone>(create);
  static FetchUserInformationRespone? _defaultInstance;

  @$pb.TagNumber(1)
  FetchAccountInformation get fetchAccountInformation => $_getN(0);
  @$pb.TagNumber(1)
  set fetchAccountInformation(FetchAccountInformation v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasFetchAccountInformation() => $_has(0);
  @$pb.TagNumber(1)
  void clearFetchAccountInformation() => clearField(1);
  @$pb.TagNumber(1)
  FetchAccountInformation ensureFetchAccountInformation() => $_ensure(0);
}

class EditUserInformationRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'EditUserInformationRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'accountInformation'), createEmptyInstance: create)
    ..aOM<AccountInformation>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'accountInformation', subBuilder: AccountInformation.create)
    ..hasRequiredFields = false
  ;

  EditUserInformationRequest._() : super();
  factory EditUserInformationRequest({
    AccountInformation? accountInformation,
  }) {
    final _result = create();
    if (accountInformation != null) {
      _result.accountInformation = accountInformation;
    }
    return _result;
  }
  factory EditUserInformationRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EditUserInformationRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EditUserInformationRequest clone() => EditUserInformationRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EditUserInformationRequest copyWith(void Function(EditUserInformationRequest) updates) => super.copyWith((message) => updates(message as EditUserInformationRequest)) as EditUserInformationRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EditUserInformationRequest create() => EditUserInformationRequest._();
  EditUserInformationRequest createEmptyInstance() => create();
  static $pb.PbList<EditUserInformationRequest> createRepeated() => $pb.PbList<EditUserInformationRequest>();
  @$core.pragma('dart2js:noInline')
  static EditUserInformationRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EditUserInformationRequest>(create);
  static EditUserInformationRequest? _defaultInstance;

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

class EditUserInformationRespone extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'EditUserInformationRespone', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'accountInformation'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  EditUserInformationRespone._() : super();
  factory EditUserInformationRespone() => create();
  factory EditUserInformationRespone.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EditUserInformationRespone.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EditUserInformationRespone clone() => EditUserInformationRespone()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EditUserInformationRespone copyWith(void Function(EditUserInformationRespone) updates) => super.copyWith((message) => updates(message as EditUserInformationRespone)) as EditUserInformationRespone; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EditUserInformationRespone create() => EditUserInformationRespone._();
  EditUserInformationRespone createEmptyInstance() => create();
  static $pb.PbList<EditUserInformationRespone> createRepeated() => $pb.PbList<EditUserInformationRespone>();
  @$core.pragma('dart2js:noInline')
  static EditUserInformationRespone getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EditUserInformationRespone>(create);
  static EditUserInformationRespone? _defaultInstance;
}

