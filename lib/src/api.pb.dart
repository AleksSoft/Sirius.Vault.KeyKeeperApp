///
//  Generated code. Do not modify.
//  source: api.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'api.pbenum.dart';

export 'api.pbenum.dart';

class GetApprovalRequestsRequests extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetApprovalRequestsRequests', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ValidatorApi'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceInfo', protoName: 'deviceInfo')
    ..hasRequiredFields = false
  ;

  GetApprovalRequestsRequests._() : super();
  factory GetApprovalRequestsRequests() => create();
  factory GetApprovalRequestsRequests.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetApprovalRequestsRequests.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetApprovalRequestsRequests clone() => GetApprovalRequestsRequests()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetApprovalRequestsRequests copyWith(void Function(GetApprovalRequestsRequests) updates) => super.copyWith((message) => updates(message as GetApprovalRequestsRequests)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetApprovalRequestsRequests create() => GetApprovalRequestsRequests._();
  GetApprovalRequestsRequests createEmptyInstance() => create();
  static $pb.PbList<GetApprovalRequestsRequests> createRepeated() => $pb.PbList<GetApprovalRequestsRequests>();
  @$core.pragma('dart2js:noInline')
  static GetApprovalRequestsRequests getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetApprovalRequestsRequests>(create);
  static GetApprovalRequestsRequests _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceInfo => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceInfo($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDeviceInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceInfo() => clearField(1);
}

class GetApprovalRequestsResponse_ApprovalRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetApprovalRequestsResponse.ApprovalRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ValidatorApi'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'transferSigningRequestId', protoName: 'transferSigningRequestId')
    ..e<GetApprovalRequestsResponse_ApprovalRequest_RequestStatus>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: GetApprovalRequestsResponse_ApprovalRequest_RequestStatus.open, valueOf: GetApprovalRequestsResponse_ApprovalRequest_RequestStatus.valueOf, enumValues: GetApprovalRequestsResponse_ApprovalRequest_RequestStatus.values)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'transactionDetailsEncBase64', protoName: 'transactionDetailsEncBase64')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'secretEncBase64', protoName: 'secretEncBase64')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ivNonce', protoName: 'ivNonce')
    ..hasRequiredFields = false
  ;

  GetApprovalRequestsResponse_ApprovalRequest._() : super();
  factory GetApprovalRequestsResponse_ApprovalRequest() => create();
  factory GetApprovalRequestsResponse_ApprovalRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetApprovalRequestsResponse_ApprovalRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetApprovalRequestsResponse_ApprovalRequest clone() => GetApprovalRequestsResponse_ApprovalRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetApprovalRequestsResponse_ApprovalRequest copyWith(void Function(GetApprovalRequestsResponse_ApprovalRequest) updates) => super.copyWith((message) => updates(message as GetApprovalRequestsResponse_ApprovalRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetApprovalRequestsResponse_ApprovalRequest create() => GetApprovalRequestsResponse_ApprovalRequest._();
  GetApprovalRequestsResponse_ApprovalRequest createEmptyInstance() => create();
  static $pb.PbList<GetApprovalRequestsResponse_ApprovalRequest> createRepeated() => $pb.PbList<GetApprovalRequestsResponse_ApprovalRequest>();
  @$core.pragma('dart2js:noInline')
  static GetApprovalRequestsResponse_ApprovalRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetApprovalRequestsResponse_ApprovalRequest>(create);
  static GetApprovalRequestsResponse_ApprovalRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get transferSigningRequestId => $_getSZ(0);
  @$pb.TagNumber(1)
  set transferSigningRequestId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTransferSigningRequestId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransferSigningRequestId() => clearField(1);

  @$pb.TagNumber(2)
  GetApprovalRequestsResponse_ApprovalRequest_RequestStatus get status => $_getN(1);
  @$pb.TagNumber(2)
  set status(GetApprovalRequestsResponse_ApprovalRequest_RequestStatus v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get transactionDetailsEncBase64 => $_getSZ(2);
  @$pb.TagNumber(3)
  set transactionDetailsEncBase64($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTransactionDetailsEncBase64() => $_has(2);
  @$pb.TagNumber(3)
  void clearTransactionDetailsEncBase64() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get secretEncBase64 => $_getSZ(3);
  @$pb.TagNumber(4)
  set secretEncBase64($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSecretEncBase64() => $_has(3);
  @$pb.TagNumber(4)
  void clearSecretEncBase64() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get ivNonce => $_getSZ(4);
  @$pb.TagNumber(5)
  set ivNonce($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasIvNonce() => $_has(4);
  @$pb.TagNumber(5)
  void clearIvNonce() => clearField(5);
}

class GetApprovalRequestsResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetApprovalRequestsResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ValidatorApi'), createEmptyInstance: create)
    ..aOM<ValidatorApiError>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error', subBuilder: ValidatorApiError.create)
    ..pc<GetApprovalRequestsResponse_ApprovalRequest>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'payload', $pb.PbFieldType.PM, subBuilder: GetApprovalRequestsResponse_ApprovalRequest.create)
    ..hasRequiredFields = false
  ;

  GetApprovalRequestsResponse._() : super();
  factory GetApprovalRequestsResponse() => create();
  factory GetApprovalRequestsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetApprovalRequestsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetApprovalRequestsResponse clone() => GetApprovalRequestsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetApprovalRequestsResponse copyWith(void Function(GetApprovalRequestsResponse) updates) => super.copyWith((message) => updates(message as GetApprovalRequestsResponse)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetApprovalRequestsResponse create() => GetApprovalRequestsResponse._();
  GetApprovalRequestsResponse createEmptyInstance() => create();
  static $pb.PbList<GetApprovalRequestsResponse> createRepeated() => $pb.PbList<GetApprovalRequestsResponse>();
  @$core.pragma('dart2js:noInline')
  static GetApprovalRequestsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetApprovalRequestsResponse>(create);
  static GetApprovalRequestsResponse _defaultInstance;

  @$pb.TagNumber(1)
  ValidatorApiError get error => $_getN(0);
  @$pb.TagNumber(1)
  set error(ValidatorApiError v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasError() => $_has(0);
  @$pb.TagNumber(1)
  void clearError() => clearField(1);
  @$pb.TagNumber(1)
  ValidatorApiError ensureError() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<GetApprovalRequestsResponse_ApprovalRequest> get payload => $_getList(1);
}

class ResolveApprovalRequestsRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ResolveApprovalRequestsRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ValidatorApi'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'DeviceInfo', protoName: 'DeviceInfo')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'TransferSigningRequestId', protoName: 'TransferSigningRequestId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'resolutionDocumentEncBase64', protoName: 'resolutionDocumentEncBase64')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'signature')
    ..hasRequiredFields = false
  ;

  ResolveApprovalRequestsRequest._() : super();
  factory ResolveApprovalRequestsRequest() => create();
  factory ResolveApprovalRequestsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResolveApprovalRequestsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResolveApprovalRequestsRequest clone() => ResolveApprovalRequestsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResolveApprovalRequestsRequest copyWith(void Function(ResolveApprovalRequestsRequest) updates) => super.copyWith((message) => updates(message as ResolveApprovalRequestsRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResolveApprovalRequestsRequest create() => ResolveApprovalRequestsRequest._();
  ResolveApprovalRequestsRequest createEmptyInstance() => create();
  static $pb.PbList<ResolveApprovalRequestsRequest> createRepeated() => $pb.PbList<ResolveApprovalRequestsRequest>();
  @$core.pragma('dart2js:noInline')
  static ResolveApprovalRequestsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResolveApprovalRequestsRequest>(create);
  static ResolveApprovalRequestsRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceInfo => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceInfo($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDeviceInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceInfo() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get transferSigningRequestId => $_getSZ(1);
  @$pb.TagNumber(2)
  set transferSigningRequestId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTransferSigningRequestId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTransferSigningRequestId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get resolutionDocumentEncBase64 => $_getSZ(2);
  @$pb.TagNumber(3)
  set resolutionDocumentEncBase64($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasResolutionDocumentEncBase64() => $_has(2);
  @$pb.TagNumber(3)
  void clearResolutionDocumentEncBase64() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get signature => $_getSZ(3);
  @$pb.TagNumber(4)
  set signature($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSignature() => $_has(3);
  @$pb.TagNumber(4)
  void clearSignature() => clearField(4);
}

class ResolveApprovalRequestsResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ResolveApprovalRequestsResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ValidatorApi'), createEmptyInstance: create)
    ..aOM<ValidatorApiError>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error', subBuilder: ValidatorApiError.create)
    ..hasRequiredFields = false
  ;

  ResolveApprovalRequestsResponse._() : super();
  factory ResolveApprovalRequestsResponse() => create();
  factory ResolveApprovalRequestsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResolveApprovalRequestsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResolveApprovalRequestsResponse clone() => ResolveApprovalRequestsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResolveApprovalRequestsResponse copyWith(void Function(ResolveApprovalRequestsResponse) updates) => super.copyWith((message) => updates(message as ResolveApprovalRequestsResponse)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResolveApprovalRequestsResponse create() => ResolveApprovalRequestsResponse._();
  ResolveApprovalRequestsResponse createEmptyInstance() => create();
  static $pb.PbList<ResolveApprovalRequestsResponse> createRepeated() => $pb.PbList<ResolveApprovalRequestsResponse>();
  @$core.pragma('dart2js:noInline')
  static ResolveApprovalRequestsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResolveApprovalRequestsResponse>(create);
  static ResolveApprovalRequestsResponse _defaultInstance;

  @$pb.TagNumber(1)
  ValidatorApiError get error => $_getN(0);
  @$pb.TagNumber(1)
  set error(ValidatorApiError v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasError() => $_has(0);
  @$pb.TagNumber(1)
  void clearError() => clearField(1);
  @$pb.TagNumber(1)
  ValidatorApiError ensureError() => $_ensure(0);
}

class AcceptRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AcceptRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ValidatorApi'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceInfo', protoName: 'deviceInfo')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'inviteId', protoName: 'inviteId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'validatorId', protoName: 'validatorId')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'publicKeyPem', protoName: 'publicKeyPem')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pushNotificationFCMToken', protoName: 'pushNotificationFCMToken')
    ..hasRequiredFields = false
  ;

  AcceptRequest._() : super();
  factory AcceptRequest() => create();
  factory AcceptRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AcceptRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AcceptRequest clone() => AcceptRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AcceptRequest copyWith(void Function(AcceptRequest) updates) => super.copyWith((message) => updates(message as AcceptRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AcceptRequest create() => AcceptRequest._();
  AcceptRequest createEmptyInstance() => create();
  static $pb.PbList<AcceptRequest> createRepeated() => $pb.PbList<AcceptRequest>();
  @$core.pragma('dart2js:noInline')
  static AcceptRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AcceptRequest>(create);
  static AcceptRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceInfo => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceInfo($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDeviceInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceInfo() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get inviteId => $_getSZ(1);
  @$pb.TagNumber(2)
  set inviteId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasInviteId() => $_has(1);
  @$pb.TagNumber(2)
  void clearInviteId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get validatorId => $_getSZ(2);
  @$pb.TagNumber(3)
  set validatorId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasValidatorId() => $_has(2);
  @$pb.TagNumber(3)
  void clearValidatorId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get publicKeyPem => $_getSZ(3);
  @$pb.TagNumber(4)
  set publicKeyPem($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPublicKeyPem() => $_has(3);
  @$pb.TagNumber(4)
  void clearPublicKeyPem() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get pushNotificationFCMToken => $_getSZ(4);
  @$pb.TagNumber(5)
  set pushNotificationFCMToken($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPushNotificationFCMToken() => $_has(4);
  @$pb.TagNumber(5)
  void clearPushNotificationFCMToken() => clearField(5);
}

class AcceptResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AcceptResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ValidatorApi'), createEmptyInstance: create)
    ..aOM<ValidatorApiError>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error', subBuilder: ValidatorApiError.create)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'apiKey', protoName: 'apiKey')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'position')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..hasRequiredFields = false
  ;

  AcceptResponse._() : super();
  factory AcceptResponse() => create();
  factory AcceptResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AcceptResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AcceptResponse clone() => AcceptResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AcceptResponse copyWith(void Function(AcceptResponse) updates) => super.copyWith((message) => updates(message as AcceptResponse)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AcceptResponse create() => AcceptResponse._();
  AcceptResponse createEmptyInstance() => create();
  static $pb.PbList<AcceptResponse> createRepeated() => $pb.PbList<AcceptResponse>();
  @$core.pragma('dart2js:noInline')
  static AcceptResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AcceptResponse>(create);
  static AcceptResponse _defaultInstance;

  @$pb.TagNumber(1)
  ValidatorApiError get error => $_getN(0);
  @$pb.TagNumber(1)
  set error(ValidatorApiError v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasError() => $_has(0);
  @$pb.TagNumber(1)
  void clearError() => clearField(1);
  @$pb.TagNumber(1)
  ValidatorApiError ensureError() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get apiKey => $_getSZ(1);
  @$pb.TagNumber(2)
  set apiKey($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasApiKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearApiKey() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get position => $_getSZ(3);
  @$pb.TagNumber(4)
  set position($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPosition() => $_has(3);
  @$pb.TagNumber(4)
  void clearPosition() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get description => $_getSZ(4);
  @$pb.TagNumber(5)
  set description($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasDescription() => $_has(4);
  @$pb.TagNumber(5)
  void clearDescription() => clearField(5);
}

class PingRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PingRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ValidatorApi'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceInfo', protoName: 'deviceInfo')
    ..hasRequiredFields = false
  ;

  PingRequest._() : super();
  factory PingRequest() => create();
  factory PingRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PingRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PingRequest clone() => PingRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PingRequest copyWith(void Function(PingRequest) updates) => super.copyWith((message) => updates(message as PingRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PingRequest create() => PingRequest._();
  PingRequest createEmptyInstance() => create();
  static $pb.PbList<PingRequest> createRepeated() => $pb.PbList<PingRequest>();
  @$core.pragma('dart2js:noInline')
  static PingRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PingRequest>(create);
  static PingRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceInfo => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceInfo($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDeviceInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceInfo() => clearField(1);
}

class PingResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PingResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ValidatorApi'), createEmptyInstance: create)
    ..aOM<ValidatorApiError>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error', subBuilder: ValidatorApiError.create)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'messageEnc', protoName: 'messageEnc')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'signatureMessage', protoName: 'signatureMessage')
    ..hasRequiredFields = false
  ;

  PingResponse._() : super();
  factory PingResponse() => create();
  factory PingResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PingResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PingResponse clone() => PingResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PingResponse copyWith(void Function(PingResponse) updates) => super.copyWith((message) => updates(message as PingResponse)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PingResponse create() => PingResponse._();
  PingResponse createEmptyInstance() => create();
  static $pb.PbList<PingResponse> createRepeated() => $pb.PbList<PingResponse>();
  @$core.pragma('dart2js:noInline')
  static PingResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PingResponse>(create);
  static PingResponse _defaultInstance;

  @$pb.TagNumber(1)
  ValidatorApiError get error => $_getN(0);
  @$pb.TagNumber(1)
  set error(ValidatorApiError v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasError() => $_has(0);
  @$pb.TagNumber(1)
  void clearError() => clearField(1);
  @$pb.TagNumber(1)
  ValidatorApiError ensureError() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get messageEnc => $_getSZ(1);
  @$pb.TagNumber(2)
  set messageEnc($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMessageEnc() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessageEnc() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get signatureMessage => $_getSZ(2);
  @$pb.TagNumber(3)
  set signatureMessage($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSignatureMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearSignatureMessage() => clearField(3);
}

class RemoveVaultConnectionRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RemoveVaultConnectionRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ValidatorApi'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  RemoveVaultConnectionRequest._() : super();
  factory RemoveVaultConnectionRequest() => create();
  factory RemoveVaultConnectionRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RemoveVaultConnectionRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RemoveVaultConnectionRequest clone() => RemoveVaultConnectionRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RemoveVaultConnectionRequest copyWith(void Function(RemoveVaultConnectionRequest) updates) => super.copyWith((message) => updates(message as RemoveVaultConnectionRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RemoveVaultConnectionRequest create() => RemoveVaultConnectionRequest._();
  RemoveVaultConnectionRequest createEmptyInstance() => create();
  static $pb.PbList<RemoveVaultConnectionRequest> createRepeated() => $pb.PbList<RemoveVaultConnectionRequest>();
  @$core.pragma('dart2js:noInline')
  static RemoveVaultConnectionRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RemoveVaultConnectionRequest>(create);
  static RemoveVaultConnectionRequest _defaultInstance;
}

class RemoveVaultConnectionResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RemoveVaultConnectionResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ValidatorApi'), createEmptyInstance: create)
    ..aOM<ValidatorApiError>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error', subBuilder: ValidatorApiError.create)
    ..hasRequiredFields = false
  ;

  RemoveVaultConnectionResponse._() : super();
  factory RemoveVaultConnectionResponse() => create();
  factory RemoveVaultConnectionResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RemoveVaultConnectionResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RemoveVaultConnectionResponse clone() => RemoveVaultConnectionResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RemoveVaultConnectionResponse copyWith(void Function(RemoveVaultConnectionResponse) updates) => super.copyWith((message) => updates(message as RemoveVaultConnectionResponse)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RemoveVaultConnectionResponse create() => RemoveVaultConnectionResponse._();
  RemoveVaultConnectionResponse createEmptyInstance() => create();
  static $pb.PbList<RemoveVaultConnectionResponse> createRepeated() => $pb.PbList<RemoveVaultConnectionResponse>();
  @$core.pragma('dart2js:noInline')
  static RemoveVaultConnectionResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RemoveVaultConnectionResponse>(create);
  static RemoveVaultConnectionResponse _defaultInstance;

  @$pb.TagNumber(1)
  ValidatorApiError get error => $_getN(0);
  @$pb.TagNumber(1)
  set error(ValidatorApiError v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasError() => $_has(0);
  @$pb.TagNumber(1)
  void clearError() => clearField(1);
  @$pb.TagNumber(1)
  ValidatorApiError ensureError() => $_ensure(0);
}

class GetCurrentVersionRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetCurrentVersionRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ValidatorApi'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  GetCurrentVersionRequest._() : super();
  factory GetCurrentVersionRequest() => create();
  factory GetCurrentVersionRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetCurrentVersionRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetCurrentVersionRequest clone() => GetCurrentVersionRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetCurrentVersionRequest copyWith(void Function(GetCurrentVersionRequest) updates) => super.copyWith((message) => updates(message as GetCurrentVersionRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetCurrentVersionRequest create() => GetCurrentVersionRequest._();
  GetCurrentVersionRequest createEmptyInstance() => create();
  static $pb.PbList<GetCurrentVersionRequest> createRepeated() => $pb.PbList<GetCurrentVersionRequest>();
  @$core.pragma('dart2js:noInline')
  static GetCurrentVersionRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetCurrentVersionRequest>(create);
  static GetCurrentVersionRequest _defaultInstance;
}

class GetCurrentVersionResponce extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetCurrentVersionResponce', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ValidatorApi'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'major', $pb.PbFieldType.O3)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'minor', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  GetCurrentVersionResponce._() : super();
  factory GetCurrentVersionResponce() => create();
  factory GetCurrentVersionResponce.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetCurrentVersionResponce.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetCurrentVersionResponce clone() => GetCurrentVersionResponce()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetCurrentVersionResponce copyWith(void Function(GetCurrentVersionResponce) updates) => super.copyWith((message) => updates(message as GetCurrentVersionResponce)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetCurrentVersionResponce create() => GetCurrentVersionResponce._();
  GetCurrentVersionResponce createEmptyInstance() => create();
  static $pb.PbList<GetCurrentVersionResponce> createRepeated() => $pb.PbList<GetCurrentVersionResponce>();
  @$core.pragma('dart2js:noInline')
  static GetCurrentVersionResponce getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetCurrentVersionResponce>(create);
  static GetCurrentVersionResponce _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get major => $_getIZ(0);
  @$pb.TagNumber(1)
  set major($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMajor() => $_has(0);
  @$pb.TagNumber(1)
  void clearMajor() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get minor => $_getIZ(1);
  @$pb.TagNumber(2)
  set minor($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMinor() => $_has(1);
  @$pb.TagNumber(2)
  void clearMinor() => clearField(2);
}

class ValidatorApiError extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ValidatorApiError', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ValidatorApi'), createEmptyInstance: create)
    ..e<ValidatorApiError_ErrorCodes>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'code', $pb.PbFieldType.OE, defaultOrMaker: ValidatorApiError_ErrorCodes.Unknown, valueOf: ValidatorApiError_ErrorCodes.valueOf, enumValues: ValidatorApiError_ErrorCodes.values)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
    ..hasRequiredFields = false
  ;

  ValidatorApiError._() : super();
  factory ValidatorApiError() => create();
  factory ValidatorApiError.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ValidatorApiError.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ValidatorApiError clone() => ValidatorApiError()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ValidatorApiError copyWith(void Function(ValidatorApiError) updates) => super.copyWith((message) => updates(message as ValidatorApiError)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ValidatorApiError create() => ValidatorApiError._();
  ValidatorApiError createEmptyInstance() => create();
  static $pb.PbList<ValidatorApiError> createRepeated() => $pb.PbList<ValidatorApiError>();
  @$core.pragma('dart2js:noInline')
  static ValidatorApiError getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ValidatorApiError>(create);
  static ValidatorApiError _defaultInstance;

  @$pb.TagNumber(1)
  ValidatorApiError_ErrorCodes get code => $_getN(0);
  @$pb.TagNumber(1)
  set code(ValidatorApiError_ErrorCodes v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);
}

