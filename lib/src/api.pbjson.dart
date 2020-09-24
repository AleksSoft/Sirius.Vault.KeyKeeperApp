///
//  Generated code. Do not modify.
//  source: api.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const RequestToApprovalRequests$json = const {
  '1': 'RequestToApprovalRequests',
  '2': const [
    const {'1': 'deviceInfo', '3': 1, '4': 1, '5': 9, '10': 'deviceInfo'},
  ],
};

const RequestToApprovalResponse$json = const {
  '1': 'RequestToApprovalResponse',
  '2': const [
    const {'1': 'error', '3': 1, '4': 1, '5': 11, '6': '.ValidatorApi.ValidatorApiError', '10': 'error'},
    const {'1': 'payload', '3': 2, '4': 3, '5': 11, '6': '.ValidatorApi.RequestToApprovalResponse.RequestToApproval', '10': 'payload'},
  ],
  '3': const [RequestToApprovalResponse_RequestToApproval$json],
};

const RequestToApprovalResponse_RequestToApproval$json = const {
  '1': 'RequestToApproval',
  '2': const [
    const {'1': 'transferSigningRequestId', '3': 1, '4': 1, '5': 9, '10': 'transferSigningRequestId'},
    const {'1': 'status', '3': 2, '4': 1, '5': 14, '6': '.ValidatorApi.RequestToApprovalResponse.RequestToApproval.RequestStatus', '10': 'status'},
    const {'1': 'transactionDetailEnc', '3': 3, '4': 1, '5': 12, '10': 'transactionDetailEnc'},
    const {'1': 'secretEnc', '3': 4, '4': 1, '5': 12, '10': 'secretEnc'},
  ],
  '4': const [RequestToApprovalResponse_RequestToApproval_RequestStatus$json],
};

const RequestToApprovalResponse_RequestToApproval_RequestStatus$json = const {
  '1': 'RequestStatus',
  '2': const [
    const {'1': 'open', '2': 0},
    const {'1': 'close', '2': 1},
  ],
};

const ResolveRequestToApprovalRequest$json = const {
  '1': 'ResolveRequestToApprovalRequest',
  '2': const [
    const {'1': 'DeviceInfo', '3': 1, '4': 1, '5': 9, '10': 'DeviceInfo'},
    const {'1': 'TransferSigningRequestId', '3': 2, '4': 1, '5': 9, '10': 'TransferSigningRequestId'},
    const {'1': 'resolution', '3': 3, '4': 1, '5': 14, '6': '.ValidatorApi.ResolveRequestToApprovalRequest.ResolutionStatus', '10': 'resolution'},
    const {'1': 'resolutionMessage', '3': 4, '4': 1, '5': 9, '10': 'resolutionMessage'},
    const {'1': 'signature', '3': 5, '4': 1, '5': 9, '10': 'signature'},
  ],
  '4': const [ResolveRequestToApprovalRequest_ResolutionStatus$json],
};

const ResolveRequestToApprovalRequest_ResolutionStatus$json = const {
  '1': 'ResolutionStatus',
  '2': const [
    const {'1': 'approve', '2': 0},
    const {'1': 'reject', '2': 1},
    const {'1': 'skip', '2': 2},
  ],
};

const ResolveRequestToApprovalResponse$json = const {
  '1': 'ResolveRequestToApprovalResponse',
  '2': const [
    const {'1': 'error', '3': 1, '4': 1, '5': 11, '6': '.ValidatorApi.ValidatorApiError', '10': 'error'},
  ],
};

const AcceptRequest$json = const {
  '1': 'AcceptRequest',
  '2': const [
    const {'1': 'deviceInfo', '3': 1, '4': 1, '5': 9, '10': 'deviceInfo'},
    const {'1': 'inviteId', '3': 2, '4': 1, '5': 9, '10': 'inviteId'},
    const {'1': 'validatorId', '3': 3, '4': 1, '5': 9, '10': 'validatorId'},
  ],
};

const AcceptResponse$json = const {
  '1': 'AcceptResponse',
  '2': const [
    const {'1': 'error', '3': 1, '4': 1, '5': 11, '6': '.ValidatorApi.ValidatorApiError', '10': 'error'},
    const {'1': 'apiKey', '3': 2, '4': 1, '5': 9, '10': 'apiKey'},
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'position', '3': 4, '4': 1, '5': 9, '10': 'position'},
    const {'1': 'description', '3': 5, '4': 1, '5': 9, '10': 'description'},
  ],
};

const PingRequest$json = const {
  '1': 'PingRequest',
  '2': const [
    const {'1': 'deviceInfo', '3': 1, '4': 1, '5': 9, '10': 'deviceInfo'},
  ],
};

const PingResponse$json = const {
  '1': 'PingResponse',
  '2': const [
    const {'1': 'error', '3': 1, '4': 1, '5': 11, '6': '.ValidatorApi.ValidatorApiError', '10': 'error'},
    const {'1': 'messageEnc', '3': 2, '4': 1, '5': 12, '10': 'messageEnc'},
    const {'1': 'signatureMessage', '3': 3, '4': 1, '5': 9, '10': 'signatureMessage'},
  ],
};

const ValidatorApiError$json = const {
  '1': 'ValidatorApiError',
  '2': const [
    const {'1': 'code', '3': 1, '4': 1, '5': 14, '6': '.ValidatorApi.ValidatorApiError.ErrorCodes', '10': 'code'},
    const {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
  '4': const [ValidatorApiError_ErrorCodes$json],
};

const ValidatorApiError_ErrorCodes$json = const {
  '1': 'ErrorCodes',
  '2': const [
    const {'1': 'Unknown', '2': 0},
    const {'1': 'InternalServerError', '2': 1},
    const {'1': 'WrongDeviceInfo', '2': 2},
    const {'1': 'WrongSignature', '2': 3},
    const {'1': 'WrongInvitation', '2': 4},
    const {'1': 'ExpiredInvitation', '2': 5},
  ],
};

