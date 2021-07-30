///
//  Generated code. Do not modify.
//  source: authentication.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use testingRequestDescriptor instead')
const TestingRequest$json = const {
  '1': 'TestingRequest',
};

/// Descriptor for `TestingRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List testingRequestDescriptor = $convert.base64Decode('Cg5UZXN0aW5nUmVxdWVzdA==');
@$core.Deprecated('Use testingResponeDescriptor instead')
const TestingRespone$json = const {
  '1': 'TestingRespone',
};

/// Descriptor for `TestingRespone`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List testingResponeDescriptor = $convert.base64Decode('Cg5UZXN0aW5nUmVzcG9uZQ==');
@$core.Deprecated('Use accountAuthorizationDescriptor instead')
const AccountAuthorization$json = const {
  '1': 'AccountAuthorization',
  '2': const [
    const {'1': 'user_email', '3': 1, '4': 1, '5': 9, '10': 'userEmail'},
    const {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `AccountAuthorization`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List accountAuthorizationDescriptor = $convert.base64Decode('ChRBY2NvdW50QXV0aG9yaXphdGlvbhIdCgp1c2VyX2VtYWlsGAEgASgJUgl1c2VyRW1haWwSGgoIcGFzc3dvcmQYAiABKAlSCHBhc3N3b3Jk');
@$core.Deprecated('Use autoLoginRequestDescriptor instead')
const AutoLoginRequest$json = const {
  '1': 'AutoLoginRequest',
  '2': const [
    const {'1': 'device_unique_id', '3': 1, '4': 1, '5': 9, '10': 'deviceUniqueId'},
  ],
};

/// Descriptor for `AutoLoginRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List autoLoginRequestDescriptor = $convert.base64Decode('ChBBdXRvTG9naW5SZXF1ZXN0EigKEGRldmljZV91bmlxdWVfaWQYASABKAlSDmRldmljZVVuaXF1ZUlk');
@$core.Deprecated('Use autoLoginResponeDescriptor instead')
const AutoLoginRespone$json = const {
  '1': 'AutoLoginRespone',
  '2': const [
    const {'1': 'token', '3': 1, '4': 1, '5': 9, '10': 'token'},
    const {'1': 'expiry_time_seconds', '3': 2, '4': 1, '5': 5, '10': 'expiryTimeSeconds'},
  ],
};

/// Descriptor for `AutoLoginRespone`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List autoLoginResponeDescriptor = $convert.base64Decode('ChBBdXRvTG9naW5SZXNwb25lEhQKBXRva2VuGAEgASgJUgV0b2tlbhIuChNleHBpcnlfdGltZV9zZWNvbmRzGAIgASgFUhFleHBpcnlUaW1lU2Vjb25kcw==');
@$core.Deprecated('Use loginRequestDescriptor instead')
const LoginRequest$json = const {
  '1': 'LoginRequest',
  '2': const [
    const {'1': 'account_authorization', '3': 1, '4': 1, '5': 11, '6': '.authentication.AccountAuthorization', '10': 'accountAuthorization'},
    const {'1': 'device_unique_id', '3': 2, '4': 1, '5': 9, '10': 'deviceUniqueId'},
  ],
};

/// Descriptor for `LoginRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginRequestDescriptor = $convert.base64Decode('CgxMb2dpblJlcXVlc3QSWQoVYWNjb3VudF9hdXRob3JpemF0aW9uGAEgASgLMiQuYXV0aGVudGljYXRpb24uQWNjb3VudEF1dGhvcml6YXRpb25SFGFjY291bnRBdXRob3JpemF0aW9uEigKEGRldmljZV91bmlxdWVfaWQYAiABKAlSDmRldmljZVVuaXF1ZUlk');
@$core.Deprecated('Use loginResponeDescriptor instead')
const LoginRespone$json = const {
  '1': 'LoginRespone',
  '2': const [
    const {'1': 'token', '3': 1, '4': 1, '5': 9, '10': 'token'},
    const {'1': 'expiry_time_seconds', '3': 2, '4': 1, '5': 5, '10': 'expiryTimeSeconds'},
  ],
};

/// Descriptor for `LoginRespone`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginResponeDescriptor = $convert.base64Decode('CgxMb2dpblJlc3BvbmUSFAoFdG9rZW4YASABKAlSBXRva2VuEi4KE2V4cGlyeV90aW1lX3NlY29uZHMYAiABKAVSEWV4cGlyeVRpbWVTZWNvbmRz');
@$core.Deprecated('Use logoutRequestDescriptor instead')
const LogoutRequest$json = const {
  '1': 'LogoutRequest',
  '2': const [
    const {'1': 'user_email', '3': 1, '4': 1, '5': 9, '10': 'userEmail'},
    const {'1': 'device_unique_id', '3': 2, '4': 1, '5': 9, '10': 'deviceUniqueId'},
  ],
};

/// Descriptor for `LogoutRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List logoutRequestDescriptor = $convert.base64Decode('Cg1Mb2dvdXRSZXF1ZXN0Eh0KCnVzZXJfZW1haWwYASABKAlSCXVzZXJFbWFpbBIoChBkZXZpY2VfdW5pcXVlX2lkGAIgASgJUg5kZXZpY2VVbmlxdWVJZA==');
@$core.Deprecated('Use lougoutResponeDescriptor instead')
const LougoutRespone$json = const {
  '1': 'LougoutRespone',
  '2': const [
    const {'1': 'user_email', '3': 1, '4': 1, '5': 9, '10': 'userEmail'},
    const {'1': 'device_unique_id', '3': 2, '4': 1, '5': 9, '10': 'deviceUniqueId'},
  ],
};

/// Descriptor for `LougoutRespone`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List lougoutResponeDescriptor = $convert.base64Decode('Cg5Mb3Vnb3V0UmVzcG9uZRIdCgp1c2VyX2VtYWlsGAEgASgJUgl1c2VyRW1haWwSKAoQZGV2aWNlX3VuaXF1ZV9pZBgCIAEoCVIOZGV2aWNlVW5pcXVlSWQ=');
@$core.Deprecated('Use createAccountRequestDescriptor instead')
const CreateAccountRequest$json = const {
  '1': 'CreateAccountRequest',
  '2': const [
    const {'1': 'account_authorization', '3': 1, '4': 1, '5': 11, '6': '.authentication.AccountAuthorization', '10': 'accountAuthorization'},
  ],
};

/// Descriptor for `CreateAccountRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createAccountRequestDescriptor = $convert.base64Decode('ChRDcmVhdGVBY2NvdW50UmVxdWVzdBJZChVhY2NvdW50X2F1dGhvcml6YXRpb24YASABKAsyJC5hdXRoZW50aWNhdGlvbi5BY2NvdW50QXV0aG9yaXphdGlvblIUYWNjb3VudEF1dGhvcml6YXRpb24=');
@$core.Deprecated('Use createAccountResponeDescriptor instead')
const CreateAccountRespone$json = const {
  '1': 'CreateAccountRespone',
  '2': const [
    const {'1': 'create_status', '3': 1, '4': 1, '5': 8, '10': 'createStatus'},
  ],
};

/// Descriptor for `CreateAccountRespone`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createAccountResponeDescriptor = $convert.base64Decode('ChRDcmVhdGVBY2NvdW50UmVzcG9uZRIjCg1jcmVhdGVfc3RhdHVzGAEgASgIUgxjcmVhdGVTdGF0dXM=');
@$core.Deprecated('Use emailVerificationRequestDescriptor instead')
const EmailVerificationRequest$json = const {
  '1': 'EmailVerificationRequest',
  '2': const [
    const {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
  ],
};

/// Descriptor for `EmailVerificationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emailVerificationRequestDescriptor = $convert.base64Decode('ChhFbWFpbFZlcmlmaWNhdGlvblJlcXVlc3QSFAoFZW1haWwYASABKAlSBWVtYWls');
@$core.Deprecated('Use emailVerificationResponeDescriptor instead')
const EmailVerificationRespone$json = const {
  '1': 'EmailVerificationRespone',
};

/// Descriptor for `EmailVerificationRespone`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emailVerificationResponeDescriptor = $convert.base64Decode('ChhFbWFpbFZlcmlmaWNhdGlvblJlc3BvbmU=');
@$core.Deprecated('Use emailVerificationCodeRequestDescriptor instead')
const EmailVerificationCodeRequest$json = const {
  '1': 'EmailVerificationCodeRequest',
  '2': const [
    const {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'code', '3': 2, '4': 1, '5': 5, '10': 'code'},
    const {'1': 'device_unique_id', '3': 3, '4': 1, '5': 9, '10': 'deviceUniqueId'},
  ],
};

/// Descriptor for `EmailVerificationCodeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emailVerificationCodeRequestDescriptor = $convert.base64Decode('ChxFbWFpbFZlcmlmaWNhdGlvbkNvZGVSZXF1ZXN0EhQKBWVtYWlsGAEgASgJUgVlbWFpbBISCgRjb2RlGAIgASgFUgRjb2RlEigKEGRldmljZV91bmlxdWVfaWQYAyABKAlSDmRldmljZVVuaXF1ZUlk');
@$core.Deprecated('Use emailVerificationCodeResponeDescriptor instead')
const EmailVerificationCodeRespone$json = const {
  '1': 'EmailVerificationCodeRespone',
  '2': const [
    const {'1': 'verify_status', '3': 1, '4': 1, '5': 8, '10': 'verifyStatus'},
    const {'1': 'token', '3': 2, '4': 1, '5': 9, '10': 'token'},
  ],
};

/// Descriptor for `EmailVerificationCodeRespone`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emailVerificationCodeResponeDescriptor = $convert.base64Decode('ChxFbWFpbFZlcmlmaWNhdGlvbkNvZGVSZXNwb25lEiMKDXZlcmlmeV9zdGF0dXMYASABKAhSDHZlcmlmeVN0YXR1cxIUCgV0b2tlbhgCIAEoCVIFdG9rZW4=');
@$core.Deprecated('Use forgotPasswordResquestDescriptor instead')
const ForgotPasswordResquest$json = const {
  '1': 'ForgotPasswordResquest',
  '2': const [
    const {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
  ],
};

/// Descriptor for `ForgotPasswordResquest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List forgotPasswordResquestDescriptor = $convert.base64Decode('ChZGb3Jnb3RQYXNzd29yZFJlc3F1ZXN0EhQKBWVtYWlsGAEgASgJUgVlbWFpbA==');
@$core.Deprecated('Use forgotPasswordResponeDescriptor instead')
const ForgotPasswordRespone$json = const {
  '1': 'ForgotPasswordRespone',
  '2': const [
    const {'1': 'token', '3': 1, '4': 1, '5': 9, '10': 'token'},
  ],
};

/// Descriptor for `ForgotPasswordRespone`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List forgotPasswordResponeDescriptor = $convert.base64Decode('ChVGb3Jnb3RQYXNzd29yZFJlc3BvbmUSFAoFdG9rZW4YASABKAlSBXRva2Vu');
@$core.Deprecated('Use changePasswordResquestDescriptor instead')
const ChangePasswordResquest$json = const {
  '1': 'ChangePasswordResquest',
  '2': const [
    const {'1': 'password', '3': 1, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `ChangePasswordResquest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List changePasswordResquestDescriptor = $convert.base64Decode('ChZDaGFuZ2VQYXNzd29yZFJlc3F1ZXN0EhoKCHBhc3N3b3JkGAEgASgJUghwYXNzd29yZA==');
@$core.Deprecated('Use changePasswordResponeDescriptor instead')
const ChangePasswordRespone$json = const {
  '1': 'ChangePasswordRespone',
};

/// Descriptor for `ChangePasswordRespone`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List changePasswordResponeDescriptor = $convert.base64Decode('ChVDaGFuZ2VQYXNzd29yZFJlc3BvbmU=');
@$core.Deprecated('Use changePasswordWithOldPasswordRequestDescriptor instead')
const ChangePasswordWithOldPasswordRequest$json = const {
  '1': 'ChangePasswordWithOldPasswordRequest',
  '2': const [
    const {'1': 'old_password', '3': 1, '4': 1, '5': 9, '10': 'oldPassword'},
    const {'1': 'new_password', '3': 2, '4': 1, '5': 9, '10': 'newPassword'},
  ],
};

/// Descriptor for `ChangePasswordWithOldPasswordRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List changePasswordWithOldPasswordRequestDescriptor = $convert.base64Decode('CiRDaGFuZ2VQYXNzd29yZFdpdGhPbGRQYXNzd29yZFJlcXVlc3QSIQoMb2xkX3Bhc3N3b3JkGAEgASgJUgtvbGRQYXNzd29yZBIhCgxuZXdfcGFzc3dvcmQYAiABKAlSC25ld1Bhc3N3b3Jk');
@$core.Deprecated('Use changePasswordWithOldPasswordResponeDescriptor instead')
const ChangePasswordWithOldPasswordRespone$json = const {
  '1': 'ChangePasswordWithOldPasswordRespone',
};

/// Descriptor for `ChangePasswordWithOldPasswordRespone`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List changePasswordWithOldPasswordResponeDescriptor = $convert.base64Decode('CiRDaGFuZ2VQYXNzd29yZFdpdGhPbGRQYXNzd29yZFJlc3BvbmU=');
@$core.Deprecated('Use authorizationRequestDescriptor instead')
const AuthorizationRequest$json = const {
  '1': 'AuthorizationRequest',
  '2': const [
    const {'1': 'token', '3': 1, '4': 1, '5': 9, '10': 'token'},
  ],
};

/// Descriptor for `AuthorizationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List authorizationRequestDescriptor = $convert.base64Decode('ChRBdXRob3JpemF0aW9uUmVxdWVzdBIUCgV0b2tlbhgBIAEoCVIFdG9rZW4=');
@$core.Deprecated('Use authorizationResponeDescriptor instead')
const AuthorizationRespone$json = const {
  '1': 'AuthorizationRespone',
  '2': const [
    const {'1': 'is_authorized', '3': 1, '4': 1, '5': 8, '10': 'isAuthorized'},
    const {'1': 'user_email', '3': 2, '4': 1, '5': 9, '10': 'userEmail'},
    const {'1': 'objectId', '3': 3, '4': 1, '5': 9, '10': 'objectId'},
  ],
};

/// Descriptor for `AuthorizationRespone`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List authorizationResponeDescriptor = $convert.base64Decode('ChRBdXRob3JpemF0aW9uUmVzcG9uZRIjCg1pc19hdXRob3JpemVkGAEgASgIUgxpc0F1dGhvcml6ZWQSHQoKdXNlcl9lbWFpbBgCIAEoCVIJdXNlckVtYWlsEhoKCG9iamVjdElkGAMgASgJUghvYmplY3RJZA==');
