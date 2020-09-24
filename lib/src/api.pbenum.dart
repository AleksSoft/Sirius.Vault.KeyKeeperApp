///
//  Generated code. Do not modify.
//  source: api.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

// ignore_for_file: UNDEFINED_SHOWN_NAME,UNUSED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class RequestToApprovalResponse_RequestToApproval_RequestStatus extends $pb.ProtobufEnum {
  static const RequestToApprovalResponse_RequestToApproval_RequestStatus open = RequestToApprovalResponse_RequestToApproval_RequestStatus._(0, 'open');
  static const RequestToApprovalResponse_RequestToApproval_RequestStatus close = RequestToApprovalResponse_RequestToApproval_RequestStatus._(1, 'close');

  static const $core.List<RequestToApprovalResponse_RequestToApproval_RequestStatus> values = <RequestToApprovalResponse_RequestToApproval_RequestStatus> [
    open,
    close,
  ];

  static final $core.Map<$core.int, RequestToApprovalResponse_RequestToApproval_RequestStatus> _byValue = $pb.ProtobufEnum.initByValue(values);
  static RequestToApprovalResponse_RequestToApproval_RequestStatus valueOf($core.int value) => _byValue[value];

  const RequestToApprovalResponse_RequestToApproval_RequestStatus._($core.int v, $core.String n) : super(v, n);
}

class ResolveRequestToApprovalRequest_ResolutionStatus extends $pb.ProtobufEnum {
  static const ResolveRequestToApprovalRequest_ResolutionStatus approve = ResolveRequestToApprovalRequest_ResolutionStatus._(0, 'approve');
  static const ResolveRequestToApprovalRequest_ResolutionStatus reject = ResolveRequestToApprovalRequest_ResolutionStatus._(1, 'reject');
  static const ResolveRequestToApprovalRequest_ResolutionStatus skip = ResolveRequestToApprovalRequest_ResolutionStatus._(2, 'skip');

  static const $core.List<ResolveRequestToApprovalRequest_ResolutionStatus> values = <ResolveRequestToApprovalRequest_ResolutionStatus> [
    approve,
    reject,
    skip,
  ];

  static final $core.Map<$core.int, ResolveRequestToApprovalRequest_ResolutionStatus> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ResolveRequestToApprovalRequest_ResolutionStatus valueOf($core.int value) => _byValue[value];

  const ResolveRequestToApprovalRequest_ResolutionStatus._($core.int v, $core.String n) : super(v, n);
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

