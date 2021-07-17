///
//  Generated code. Do not modify.
//  source: authentication.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
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
@$core.Deprecated('Use loginRequestDescriptor instead')
const LoginRequest$json = const {
  '1': 'LoginRequest',
  '2': const [
    const {'1': 'account_information', '3': 1, '4': 1, '5': 11, '6': '.authentication.AccountInformation', '10': 'accountInformation'},
  ],
};

/// Descriptor for `LoginRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginRequestDescriptor = $convert.base64Decode('CgxMb2dpblJlcXVlc3QSUwoTYWNjb3VudF9pbmZvcm1hdGlvbhgBIAEoCzIiLmF1dGhlbnRpY2F0aW9uLkFjY291bnRJbmZvcm1hdGlvblISYWNjb3VudEluZm9ybWF0aW9u');
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