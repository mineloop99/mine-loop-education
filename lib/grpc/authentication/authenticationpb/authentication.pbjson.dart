///
//  Generated code. Do not modify.
//  source: authentication.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use authenticationInformationDescriptor instead')
const AuthenticationInformation$json = const {
  '1': 'AuthenticationInformation',
  '2': const [
    const {'1': 'user_email', '3': 1, '4': 1, '5': 9, '10': 'userEmail'},
    const {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `AuthenticationInformation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List authenticationInformationDescriptor = $convert.base64Decode('ChlBdXRoZW50aWNhdGlvbkluZm9ybWF0aW9uEh0KCnVzZXJfZW1haWwYASABKAlSCXVzZXJFbWFpbBIaCghwYXNzd29yZBgCIAEoCVIIcGFzc3dvcmQ=');
@$core.Deprecated('Use authenticateRequestDescriptor instead')
const AuthenticateRequest$json = const {
  '1': 'AuthenticateRequest',
  '2': const [
    const {'1': 'authentication_information', '3': 1, '4': 1, '5': 11, '6': '.authentication.AuthenticationInformation', '10': 'authenticationInformation'},
  ],
};

/// Descriptor for `AuthenticateRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List authenticateRequestDescriptor = $convert.base64Decode('ChNBdXRoZW50aWNhdGVSZXF1ZXN0EmgKGmF1dGhlbnRpY2F0aW9uX2luZm9ybWF0aW9uGAEgASgLMikuYXV0aGVudGljYXRpb24uQXV0aGVudGljYXRpb25JbmZvcm1hdGlvblIZYXV0aGVudGljYXRpb25JbmZvcm1hdGlvbg==');
@$core.Deprecated('Use authenticateResponeDescriptor instead')
const AuthenticateRespone$json = const {
  '1': 'AuthenticateRespone',
  '2': const [
    const {'1': 'token', '3': 1, '4': 1, '5': 9, '10': 'token'},
    const {'1': 'expiry_time_seconds', '3': 2, '4': 1, '5': 5, '10': 'expiryTimeSeconds'},
  ],
};

/// Descriptor for `AuthenticateRespone`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List authenticateResponeDescriptor = $convert.base64Decode('ChNBdXRoZW50aWNhdGVSZXNwb25lEhQKBXRva2VuGAEgASgJUgV0b2tlbhIuChNleHBpcnlfdGltZV9zZWNvbmRzGAIgASgFUhFleHBpcnlUaW1lU2Vjb25kcw==');
@$core.Deprecated('Use helloRequestDescriptor instead')
const HelloRequest$json = const {
  '1': 'HelloRequest',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `HelloRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List helloRequestDescriptor = $convert.base64Decode('CgxIZWxsb1JlcXVlc3QSEgoEbmFtZRgBIAEoCVIEbmFtZQ==');
@$core.Deprecated('Use helloResponeDescriptor instead')
const HelloRespone$json = const {
  '1': 'HelloRespone',
  '2': const [
    const {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `HelloRespone`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List helloResponeDescriptor = $convert.base64Decode('CgxIZWxsb1Jlc3BvbmUSGAoHbWVzc2FnZRgBIAEoCVIHbWVzc2FnZQ==');
