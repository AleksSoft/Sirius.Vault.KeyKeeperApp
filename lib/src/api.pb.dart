///
//  Generated code. Do not modify.
//  source: api.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'api.pbenum.dart';

export 'api.pbenum.dart';

class GetApprovalRequestsRequests extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetApprovalRequestsRequests', package: const $pb.PackageName('ValidatorApi'), createEmptyInstance: create)
    ..aOS(1, 'deviceInfo', protoName: 'deviceInfo')
    ..hasRequiredFields = false
  ;

  GetApprovalRequestsRequests._() : super();
  factory GetApprovalRequestsRequests() => create();
  factory GetApprovalRequestsRequests.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetApprovalRequestsRequests.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GetApprovalRequestsRequests clone() => GetApprovalRequestsRequests()..mergeFromMessage(this);
  GetApprovalRequestsRequests copyWith(void Function(GetApprovalRequestsRequests) updates) => super.copyWith((message) => updates(message as GetApprovalRequestsRequests));
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetApprovalRequestsResponse.ApprovalRequest', package: const $pb.PackageName('ValidatorApi'), createEmptyInstance: create)
    ..aOS(1, 'transferSigningRequestId', protoName: 'transferSigningRequestId')
    ..e<GetApprovalRequestsResponse_ApprovalRequest_RequestStatus>(2, 'status', $pb.PbFieldType.OE, defaultOrMaker: GetApprovalRequestsResponse_ApprovalRequest_RequestStatus.open, valueOf: GetApprovalRequestsResponse_ApprovalRequest_RequestStatus.valueOf, enumValues: GetApprovalRequestsResponse_ApprovalRequest_RequestStatus.values)
    ..aOS(3, 'transactionDetailsEncBase64', protoName: 'transactionDetailsEncBase64')
    ..aOS(4, 'secretEncBase64', protoName: 'secretEncBase64')
    ..aOS(5, 'ivNonce', protoName: 'ivNonce')
    ..hasRequiredFields = false
  ;

  GetApprovalRequestsResponse_ApprovalRequest._() : super();
  factory GetApprovalRequestsResponse_ApprovalRequest() => create();
  factory GetApprovalRequestsResponse_ApprovalRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetApprovalRequestsResponse_ApprovalRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GetApprovalRequestsResponse_ApprovalRequest clone() => GetApprovalRequestsResponse_ApprovalRequest()..mergeFromMessage(this);
  GetApprovalRequestsResponse_ApprovalRequest copyWith(void Function(GetApprovalRequestsResponse_ApprovalRequest) updates) => super.copyWith((message) => updates(message as GetApprovalRequestsResponse_ApprovalRequest));
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetApprovalRequestsResponse', package: const $pb.PackageName('ValidatorApi'), createEmptyInstance: create)
    ..aOM<ValidatorApiError>(1, 'error', subBuilder: ValidatorApiError.create)
    ..pc<GetApprovalRequestsResponse_ApprovalRequest>(2, 'payload', $pb.PbFieldType.PM, subBuilder: GetApprovalRequestsResponse_ApprovalRequest.create)
    ..hasRequiredFields = false
  ;

  GetApprovalRequestsResponse._() : super();
  factory GetApprovalRequestsResponse() => create();
  factory GetApprovalRequestsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetApprovalRequestsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GetApprovalRequestsResponse clone() => GetApprovalRequestsResponse()..mergeFromMessage(this);
  GetApprovalRequestsResponse copyWith(void Function(GetApprovalRequestsResponse) updates) => super.copyWith((message) => updates(message as GetApprovalRequestsResponse));
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ResolveApprovalRequestsRequest', package: const $pb.PackageName('ValidatorApi'), createEmptyInstance: create)
    ..aOS(1, 'DeviceInfo', protoName: 'DeviceInfo')
    ..aOS(2, 'TransferSigningRequestId', protoName: 'TransferSigningRequestId')
    ..aOS(3, 'resolutionDocumentEncBase64', protoName: 'resolutionDocumentEncBase64')
    ..aOS(4, 'signature')
    ..hasRequiredFields = false
  ;

  ResolveApprovalRequestsRequest._() : super();
  factory ResolveApprovalRequestsRequest() => create();
  factory ResolveApprovalRequestsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResolveApprovalRequestsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ResolveApprovalRequestsRequest clone() => ResolveApprovalRequestsRequest()..mergeFromMessage(this);
  ResolveApprovalRequestsRequest copyWith(void Function(ResolveApprovalRequestsRequest) updates) => super.copyWith((message) => updates(message as ResolveApprovalRequestsRequest));
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ResolveApprovalRequestsResponse', package: const $pb.PackageName('ValidatorApi'), createEmptyInstance: create)
    ..aOM<ValidatorApiError>(1, 'error', subBuilder: ValidatorApiError.create)
    ..hasRequiredFields = false
  ;

  ResolveApprovalRequestsResponse._() : super();
  factory ResolveApprovalRequestsResponse() => create();
  factory ResolveApprovalRequestsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResolveApprovalRequestsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ResolveApprovalRequestsResponse clone() => ResolveApprovalRequestsResponse()..mergeFromMessage(this);
  ResolveApprovalRequestsResponse copyWith(void Function(ResolveApprovalRequestsResponse) updates) => super.copyWith((message) => updates(message as ResolveApprovalRequestsResponse));
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('AcceptRequest', package: const $pb.PackageName('ValidatorApi'), createEmptyInstance: create)
    ..aOS(1, 'deviceInfo', protoName: 'deviceInfo')
    ..aOS(2, 'inviteId', protoName: 'inviteId')
    ..aOS(3, 'validatorId', protoName: 'validatorId')
    ..aOS(4, 'publicKeyPem', protoName: 'publicKeyPem')
    ..hasRequiredFields = false
  ;

  AcceptRequest._() : super();
  factory AcceptRequest() => create();
  factory AcceptRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AcceptRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  AcceptRequest clone() => AcceptRequest()..mergeFromMessage(this);
  AcceptRequest copyWith(void Function(AcceptRequest) updates) => super.copyWith((message) => updates(message as AcceptRequest));
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
}

class AcceptResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('AcceptResponse', package: const $pb.PackageName('ValidatorApi'), createEmptyInstance: create)
    ..aOM<ValidatorApiError>(1, 'error', subBuilder: ValidatorApiError.create)
    ..aOS(2, 'apiKey', protoName: 'apiKey')
    ..aOS(3, 'name')
    ..aOS(4, 'position')
    ..aOS(5, 'description')
    ..hasRequiredFields = false
  ;

  AcceptResponse._() : super();
  factory AcceptResponse() => create();
  factory AcceptResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AcceptResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  AcceptResponse clone() => AcceptResponse()..mergeFromMessage(this);
  AcceptResponse copyWith(void Function(AcceptResponse) updates) => super.copyWith((message) => updates(message as AcceptResponse));
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('PingRequest', package: const $pb.PackageName('ValidatorApi'), createEmptyInstance: create)
    ..aOS(1, 'deviceInfo', protoName: 'deviceInfo')
    ..hasRequiredFields = false
  ;

  PingRequest._() : super();
  factory PingRequest() => create();
  factory PingRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PingRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  PingRequest clone() => PingRequest()..mergeFromMessage(this);
  PingRequest copyWith(void Function(PingRequest) updates) => super.copyWith((message) => updates(message as PingRequest));
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('PingResponse', package: const $pb.PackageName('ValidatorApi'), createEmptyInstance: create)
    ..aOM<ValidatorApiError>(1, 'error', subBuilder: ValidatorApiError.create)
    ..aOS(2, 'messageEnc', protoName: 'messageEnc')
    ..aOS(3, 'signatureMessage', protoName: 'signatureMessage')
    ..hasRequiredFields = false
  ;

  PingResponse._() : super();
  factory PingResponse() => create();
  factory PingResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PingResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  PingResponse clone() => PingResponse()..mergeFromMessage(this);
  PingResponse copyWith(void Function(PingResponse) updates) => super.copyWith((message) => updates(message as PingResponse));
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

class ValidatorApiError extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ValidatorApiError', package: const $pb.PackageName('ValidatorApi'), createEmptyInstance: create)
    ..e<ValidatorApiError_ErrorCodes>(1, 'code', $pb.PbFieldType.OE, defaultOrMaker: ValidatorApiError_ErrorCodes.Unknown, valueOf: ValidatorApiError_ErrorCodes.valueOf, enumValues: ValidatorApiError_ErrorCodes.values)
    ..aOS(2, 'message')
    ..hasRequiredFields = false
  ;

  ValidatorApiError._() : super();
  factory ValidatorApiError() => create();
  factory ValidatorApiError.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ValidatorApiError.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ValidatorApiError clone() => ValidatorApiError()..mergeFromMessage(this);
  ValidatorApiError copyWith(void Function(ValidatorApiError) updates) => super.copyWith((message) => updates(message as ValidatorApiError));
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

