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

class RequestToApprovalRequests extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('RequestToApprovalRequests', package: const $pb.PackageName('ValidatorApi'), createEmptyInstance: create)
    ..aOS(1, 'deviceInfo', protoName: 'deviceInfo')
    ..hasRequiredFields = false
  ;

  RequestToApprovalRequests._() : super();
  factory RequestToApprovalRequests() => create();
  factory RequestToApprovalRequests.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RequestToApprovalRequests.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  RequestToApprovalRequests clone() => RequestToApprovalRequests()..mergeFromMessage(this);
  RequestToApprovalRequests copyWith(void Function(RequestToApprovalRequests) updates) => super.copyWith((message) => updates(message as RequestToApprovalRequests));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RequestToApprovalRequests create() => RequestToApprovalRequests._();
  RequestToApprovalRequests createEmptyInstance() => create();
  static $pb.PbList<RequestToApprovalRequests> createRepeated() => $pb.PbList<RequestToApprovalRequests>();
  @$core.pragma('dart2js:noInline')
  static RequestToApprovalRequests getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RequestToApprovalRequests>(create);
  static RequestToApprovalRequests _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceInfo => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceInfo($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDeviceInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceInfo() => clearField(1);
}

class RequestToApprovalResponse_RequestToApproval extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('RequestToApprovalResponse.RequestToApproval', package: const $pb.PackageName('ValidatorApi'), createEmptyInstance: create)
    ..aOS(1, 'transferSigningRequestId', protoName: 'transferSigningRequestId')
    ..e<RequestToApprovalResponse_RequestToApproval_RequestStatus>(2, 'status', $pb.PbFieldType.OE, defaultOrMaker: RequestToApprovalResponse_RequestToApproval_RequestStatus.open, valueOf: RequestToApprovalResponse_RequestToApproval_RequestStatus.valueOf, enumValues: RequestToApprovalResponse_RequestToApproval_RequestStatus.values)
    ..a<$core.List<$core.int>>(3, 'transactionDetailEnc', $pb.PbFieldType.OY, protoName: 'transactionDetailEnc')
    ..a<$core.List<$core.int>>(4, 'secretEnc', $pb.PbFieldType.OY, protoName: 'secretEnc')
    ..hasRequiredFields = false
  ;

  RequestToApprovalResponse_RequestToApproval._() : super();
  factory RequestToApprovalResponse_RequestToApproval() => create();
  factory RequestToApprovalResponse_RequestToApproval.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RequestToApprovalResponse_RequestToApproval.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  RequestToApprovalResponse_RequestToApproval clone() => RequestToApprovalResponse_RequestToApproval()..mergeFromMessage(this);
  RequestToApprovalResponse_RequestToApproval copyWith(void Function(RequestToApprovalResponse_RequestToApproval) updates) => super.copyWith((message) => updates(message as RequestToApprovalResponse_RequestToApproval));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RequestToApprovalResponse_RequestToApproval create() => RequestToApprovalResponse_RequestToApproval._();
  RequestToApprovalResponse_RequestToApproval createEmptyInstance() => create();
  static $pb.PbList<RequestToApprovalResponse_RequestToApproval> createRepeated() => $pb.PbList<RequestToApprovalResponse_RequestToApproval>();
  @$core.pragma('dart2js:noInline')
  static RequestToApprovalResponse_RequestToApproval getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RequestToApprovalResponse_RequestToApproval>(create);
  static RequestToApprovalResponse_RequestToApproval _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get transferSigningRequestId => $_getSZ(0);
  @$pb.TagNumber(1)
  set transferSigningRequestId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTransferSigningRequestId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransferSigningRequestId() => clearField(1);

  @$pb.TagNumber(2)
  RequestToApprovalResponse_RequestToApproval_RequestStatus get status => $_getN(1);
  @$pb.TagNumber(2)
  set status(RequestToApprovalResponse_RequestToApproval_RequestStatus v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get transactionDetailEnc => $_getN(2);
  @$pb.TagNumber(3)
  set transactionDetailEnc($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTransactionDetailEnc() => $_has(2);
  @$pb.TagNumber(3)
  void clearTransactionDetailEnc() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get secretEnc => $_getN(3);
  @$pb.TagNumber(4)
  set secretEnc($core.List<$core.int> v) { $_setBytes(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSecretEnc() => $_has(3);
  @$pb.TagNumber(4)
  void clearSecretEnc() => clearField(4);
}

class RequestToApprovalResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('RequestToApprovalResponse', package: const $pb.PackageName('ValidatorApi'), createEmptyInstance: create)
    ..aOM<ValidatorApiError>(1, 'error', subBuilder: ValidatorApiError.create)
    ..pc<RequestToApprovalResponse_RequestToApproval>(2, 'payload', $pb.PbFieldType.PM, subBuilder: RequestToApprovalResponse_RequestToApproval.create)
    ..hasRequiredFields = false
  ;

  RequestToApprovalResponse._() : super();
  factory RequestToApprovalResponse() => create();
  factory RequestToApprovalResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RequestToApprovalResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  RequestToApprovalResponse clone() => RequestToApprovalResponse()..mergeFromMessage(this);
  RequestToApprovalResponse copyWith(void Function(RequestToApprovalResponse) updates) => super.copyWith((message) => updates(message as RequestToApprovalResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RequestToApprovalResponse create() => RequestToApprovalResponse._();
  RequestToApprovalResponse createEmptyInstance() => create();
  static $pb.PbList<RequestToApprovalResponse> createRepeated() => $pb.PbList<RequestToApprovalResponse>();
  @$core.pragma('dart2js:noInline')
  static RequestToApprovalResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RequestToApprovalResponse>(create);
  static RequestToApprovalResponse _defaultInstance;

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
  $core.List<RequestToApprovalResponse_RequestToApproval> get payload => $_getList(1);
}

class ResolveRequestToApprovalRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ResolveRequestToApprovalRequest', package: const $pb.PackageName('ValidatorApi'), createEmptyInstance: create)
    ..aOS(1, 'DeviceInfo', protoName: 'DeviceInfo')
    ..aOS(2, 'TransferSigningRequestId', protoName: 'TransferSigningRequestId')
    ..e<ResolveRequestToApprovalRequest_ResolutionStatus>(3, 'resolution', $pb.PbFieldType.OE, defaultOrMaker: ResolveRequestToApprovalRequest_ResolutionStatus.approve, valueOf: ResolveRequestToApprovalRequest_ResolutionStatus.valueOf, enumValues: ResolveRequestToApprovalRequest_ResolutionStatus.values)
    ..aOS(4, 'resolutionMessage', protoName: 'resolutionMessage')
    ..aOS(5, 'signature')
    ..hasRequiredFields = false
  ;

  ResolveRequestToApprovalRequest._() : super();
  factory ResolveRequestToApprovalRequest() => create();
  factory ResolveRequestToApprovalRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResolveRequestToApprovalRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ResolveRequestToApprovalRequest clone() => ResolveRequestToApprovalRequest()..mergeFromMessage(this);
  ResolveRequestToApprovalRequest copyWith(void Function(ResolveRequestToApprovalRequest) updates) => super.copyWith((message) => updates(message as ResolveRequestToApprovalRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResolveRequestToApprovalRequest create() => ResolveRequestToApprovalRequest._();
  ResolveRequestToApprovalRequest createEmptyInstance() => create();
  static $pb.PbList<ResolveRequestToApprovalRequest> createRepeated() => $pb.PbList<ResolveRequestToApprovalRequest>();
  @$core.pragma('dart2js:noInline')
  static ResolveRequestToApprovalRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResolveRequestToApprovalRequest>(create);
  static ResolveRequestToApprovalRequest _defaultInstance;

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
  ResolveRequestToApprovalRequest_ResolutionStatus get resolution => $_getN(2);
  @$pb.TagNumber(3)
  set resolution(ResolveRequestToApprovalRequest_ResolutionStatus v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasResolution() => $_has(2);
  @$pb.TagNumber(3)
  void clearResolution() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get resolutionMessage => $_getSZ(3);
  @$pb.TagNumber(4)
  set resolutionMessage($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasResolutionMessage() => $_has(3);
  @$pb.TagNumber(4)
  void clearResolutionMessage() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get signature => $_getSZ(4);
  @$pb.TagNumber(5)
  set signature($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasSignature() => $_has(4);
  @$pb.TagNumber(5)
  void clearSignature() => clearField(5);
}

class ResolveRequestToApprovalResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ResolveRequestToApprovalResponse', package: const $pb.PackageName('ValidatorApi'), createEmptyInstance: create)
    ..aOM<ValidatorApiError>(1, 'error', subBuilder: ValidatorApiError.create)
    ..hasRequiredFields = false
  ;

  ResolveRequestToApprovalResponse._() : super();
  factory ResolveRequestToApprovalResponse() => create();
  factory ResolveRequestToApprovalResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResolveRequestToApprovalResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ResolveRequestToApprovalResponse clone() => ResolveRequestToApprovalResponse()..mergeFromMessage(this);
  ResolveRequestToApprovalResponse copyWith(void Function(ResolveRequestToApprovalResponse) updates) => super.copyWith((message) => updates(message as ResolveRequestToApprovalResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResolveRequestToApprovalResponse create() => ResolveRequestToApprovalResponse._();
  ResolveRequestToApprovalResponse createEmptyInstance() => create();
  static $pb.PbList<ResolveRequestToApprovalResponse> createRepeated() => $pb.PbList<ResolveRequestToApprovalResponse>();
  @$core.pragma('dart2js:noInline')
  static ResolveRequestToApprovalResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResolveRequestToApprovalResponse>(create);
  static ResolveRequestToApprovalResponse _defaultInstance;

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
    ..a<$core.List<$core.int>>(2, 'messageEnc', $pb.PbFieldType.OY, protoName: 'messageEnc')
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
  $core.List<$core.int> get messageEnc => $_getN(1);
  @$pb.TagNumber(2)
  set messageEnc($core.List<$core.int> v) { $_setBytes(1, v); }
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

