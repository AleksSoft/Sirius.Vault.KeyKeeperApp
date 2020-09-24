///
//  Generated code. Do not modify.
//  source: api.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

// ignore_for_file: UNDEFINED_SHOWN_NAME,UNUSED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class GetApprovalRequestsResponse_ApprovalRequest_RequestStatus extends $pb.ProtobufEnum {
  static const GetApprovalRequestsResponse_ApprovalRequest_RequestStatus open = GetApprovalRequestsResponse_ApprovalRequest_RequestStatus._(0, 'open');
  static const GetApprovalRequestsResponse_ApprovalRequest_RequestStatus close = GetApprovalRequestsResponse_ApprovalRequest_RequestStatus._(1, 'close');

  static const $core.List<GetApprovalRequestsResponse_ApprovalRequest_RequestStatus> values = <GetApprovalRequestsResponse_ApprovalRequest_RequestStatus> [
    open,
    close,
  ];

  static final $core.Map<$core.int, GetApprovalRequestsResponse_ApprovalRequest_RequestStatus> _byValue = $pb.ProtobufEnum.initByValue(values);
  static GetApprovalRequestsResponse_ApprovalRequest_RequestStatus valueOf($core.int value) => _byValue[value];

  const GetApprovalRequestsResponse_ApprovalRequest_RequestStatus._($core.int v, $core.String n) : super(v, n);
}

class ResolveApprovalRequestsRequest_ResolutionStatus extends $pb.ProtobufEnum {
  static const ResolveApprovalRequestsRequest_ResolutionStatus approve = ResolveApprovalRequestsRequest_ResolutionStatus._(0, 'approve');
  static const ResolveApprovalRequestsRequest_ResolutionStatus reject = ResolveApprovalRequestsRequest_ResolutionStatus._(1, 'reject');
  static const ResolveApprovalRequestsRequest_ResolutionStatus skip = ResolveApprovalRequestsRequest_ResolutionStatus._(2, 'skip');

  static const $core.List<ResolveApprovalRequestsRequest_ResolutionStatus> values = <ResolveApprovalRequestsRequest_ResolutionStatus> [
    approve,
    reject,
    skip,
  ];

  static final $core.Map<$core.int, ResolveApprovalRequestsRequest_ResolutionStatus> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ResolveApprovalRequestsRequest_ResolutionStatus valueOf($core.int value) => _byValue[value];

  const ResolveApprovalRequestsRequest_ResolutionStatus._($core.int v, $core.String n) : super(v, n);
}

class ValidatorApiError_ErrorCodes extends $pb.ProtobufEnum {
  static const ValidatorApiError_ErrorCodes Unknown = ValidatorApiError_ErrorCodes._(0, 'Unknown');
  static const ValidatorApiError_ErrorCodes InternalServerError = ValidatorApiError_ErrorCodes._(1, 'InternalServerError');
  static const ValidatorApiError_ErrorCodes WrongDeviceInfo = ValidatorApiError_ErrorCodes._(2, 'WrongDeviceInfo');
  static const ValidatorApiError_ErrorCodes WrongSignature = ValidatorApiError_ErrorCodes._(3, 'WrongSignature');
  static const ValidatorApiError_ErrorCodes WrongInvitation = ValidatorApiError_ErrorCodes._(4, 'WrongInvitation');
  static const ValidatorApiError_ErrorCodes ExpiredInvitation = ValidatorApiError_ErrorCodes._(5, 'ExpiredInvitation');

  static const $core.List<ValidatorApiError_ErrorCodes> values = <ValidatorApiError_ErrorCodes> [
    Unknown,
    InternalServerError,
    WrongDeviceInfo,
    WrongSignature,
    WrongInvitation,
    ExpiredInvitation,
  ];

  static final $core.Map<$core.int, ValidatorApiError_ErrorCodes> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ValidatorApiError_ErrorCodes valueOf($core.int value) => _byValue[value];

  const ValidatorApiError_ErrorCodes._($core.int v, $core.String n) : super(v, n);
}

