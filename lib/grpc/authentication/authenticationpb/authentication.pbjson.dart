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
@$core.Deprecated('Use accountInformationDescriptor instead')
const AccountInformation$json = const {
  '1': 'AccountInformation',
  '2': const [
    const {'1': 'user_email', '3': 1, '4': 1, '5': 9, '10': 'userEmail'},
    const {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `AccountInformation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List accountInformationDescriptor = $convert.base64Decode('ChJBY2NvdW50SW5mb3JtYXRpb24SHQoKdXNlcl9lbWFpbBgBIAEoCVIJdXNlckVtYWlsEhoKCHBhc3N3b3JkGAIgASgJUghwYXNzd29yZA==');
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
    const {'1': 'account_information', '3': 1, '4': 1, '5': 11, '6': '.authentication.AccountInformation', '10': 'accountInformation'},
    const {'1': 'device_unique_id', '3': 2, '4': 1, '5': 9, '10': 'deviceUniqueId'},
  ],
};

/// Descriptor for `LoginRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginRequestDescriptor = $convert.base64Decode('CgxMb2dpblJlcXVlc3QSUwoTYWNjb3VudF9pbmZvcm1hdGlvbhgBIAEoCzIiLmF1dGhlbnRpY2F0aW9uLkFjY291bnRJbmZvcm1hdGlvblISYWNjb3VudEluZm9ybWF0aW9uEigKEGRldmljZV91bmlxdWVfaWQYAiABKAlSDmRldmljZVVuaXF1ZUlk');
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
    const {'1': 'account_information', '3': 1, '4': 1, '5': 11, '6': '.authentication.AccountInformation', '10': 'accountInformation'},
  ],
};

/// Descriptor for `CreateAccountRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createAccountRequestDescriptor = $convert.base64Decode('ChRDcmVhdGVBY2NvdW50UmVxdWVzdBJTChNhY2NvdW50X2luZm9ybWF0aW9uGAEgASgLMiIuYXV0aGVudGljYXRpb24uQWNjb3VudEluZm9ybWF0aW9uUhJhY2NvdW50SW5mb3JtYXRpb24=');
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
  ],
};

/// Descriptor for `EmailVerificationCodeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emailVerificationCodeRequestDescriptor = $convert.base64Decode('ChxFbWFpbFZlcmlmaWNhdGlvbkNvZGVSZXF1ZXN0EhQKBWVtYWlsGAEgASgJUgVlbWFpbBISCgRjb2RlGAIgASgFUgRjb2Rl');
@$core.Deprecated('Use emailVerificationCodeResponeDescriptor instead')
const EmailVerificationCodeRespone$json = const {
  '1': 'EmailVerificationCodeRespone',
  '2': const [
    const {'1': 'verify_status', '3': 1, '4': 1, '5': 8, '10': 'verifyStatus'},
  ],
};

/// Descriptor for `EmailVerificationCodeRespone`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emailVerificationCodeResponeDescriptor = $convert.base64Decode('ChxFbWFpbFZlcmlmaWNhdGlvbkNvZGVSZXNwb25lEiMKDXZlcmlmeV9zdGF0dXMYASABKAhSDHZlcmlmeVN0YXR1cw==');
