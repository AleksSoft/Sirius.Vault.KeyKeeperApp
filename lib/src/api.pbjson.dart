///
//  Generated code. Do not modify.
//  source: api.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

const GetApprovalRequestsRequests$json = const {
  '1': 'GetApprovalRequestsRequests',
  '2': const [
    const {'1': 'deviceInfo', '3': 1, '4': 1, '5': 9, '10': 'deviceInfo'},
  ],
};

const GetApprovalRequestsResponse$json = const {
  '1': 'GetApprovalRequestsResponse',
  '2': const [
    const {'1': 'error', '3': 1, '4': 1, '5': 11, '6': '.ValidatorApi.ValidatorApiError', '10': 'error'},
    const {'1': 'payload', '3': 2, '4': 3, '5': 11, '6': '.ValidatorApi.GetApprovalRequestsResponse.ApprovalRequest', '10': 'payload'},
  ],
  '3': const [GetApprovalRequestsResponse_ApprovalRequest$json],
};

const GetApprovalRequestsResponse_ApprovalRequest$json = const {
  '1': 'ApprovalRequest',
  '2': const [
    const {'1': 'transferSigningRequestId', '3': 1, '4': 1, '5': 9, '10': 'transferSigningRequestId'},
    const {'1': 'status', '3': 2, '4': 1, '5': 14, '6': '.ValidatorApi.GetApprovalRequestsResponse.ApprovalRequest.RequestStatus', '10': 'status'},
    const {'1': 'transactionDetailsEncBase64', '3': 3, '4': 1, '5': 9, '10': 'transactionDetailsEncBase64'},
    const {'1': 'secretEncBase64', '3': 4, '4': 1, '5': 9, '10': 'secretEncBase64'},
    const {'1': 'ivNonce', '3': 5, '4': 1, '5': 9, '10': 'ivNonce'},
  ],
  '4': const [GetApprovalRequestsResponse_ApprovalRequest_RequestStatus$json],
};

const GetApprovalRequestsResponse_ApprovalRequest_RequestStatus$json = const {
  '1': 'RequestStatus',
  '2': const [
    const {'1': 'open', '2': 0},
    const {'1': 'close', '2': 1},
  ],
};

const ResolveApprovalRequestsRequest$json = const {
  '1': 'ResolveApprovalRequestsRequest',
  '2': const [
    const {'1': 'DeviceInfo', '3': 1, '4': 1, '5': 9, '10': 'DeviceInfo'},
    const {'1': 'TransferSigningRequestId', '3': 2, '4': 1, '5': 9, '10': 'TransferSigningRequestId'},
    const {'1': 'resolutionDocumentEncBase64', '3': 3, '4': 1, '5': 9, '10': 'resolutionDocumentEncBase64'},
    const {'1': 'signature', '3': 4, '4': 1, '5': 9, '10': 'signature'},
  ],
  '4': const [ResolveApprovalRequestsRequest_ResolutionStatus$json],
};

const ResolveApprovalRequestsRequest_ResolutionStatus$json = const {
  '1': 'ResolutionStatus',
  '2': const [
    const {'1': 'approve', '2': 0},
    const {'1': 'reject', '2': 1},
    const {'1': 'skip', '2': 2},
  ],
};

const ResolveApprovalRequestsResponse$json = const {
  '1': 'ResolveApprovalRequestsResponse',
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
    const {'1': 'publicKeyPem', '3': 4, '4': 1, '5': 9, '10': 'publicKeyPem'},
    const {'1': 'pushNotificationFCMToken', '3': 5, '4': 1, '5': 9, '10': 'pushNotificationFCMToken'},
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
    const {'1': 'messageEnc', '3': 2, '4': 1, '5': 9, '10': 'messageEnc'},
    const {'1': 'signatureMessage', '3': 3, '4': 1, '5': 9, '10': 'signatureMessage'},
  ],
};

const RemoveVaultConnectionRequest$json = const {
  '1': 'RemoveVaultConnectionRequest',
};

const RemoveVaultConnectionResponse$json = const {
  '1': 'RemoveVaultConnectionResponse',
  '2': const [
    const {'1': 'error', '3': 1, '4': 1, '5': 11, '6': '.ValidatorApi.ValidatorApiError', '10': 'error'},
  ],
};

const RefreshPushNotificationFCMTokenRequest$json = const {
  '1': 'RefreshPushNotificationFCMTokenRequest',
  '2': const [
    const {'1': 'pushNotificationFCMToken', '3': 1, '4': 1, '5': 9, '10': 'pushNotificationFCMToken'},
  ],
};

const RefreshPushNotificationFCMTokenResponse$json = const {
  '1': 'RefreshPushNotificationFCMTokenResponse',
  '2': const [
    const {'1': 'error', '3': 1, '4': 1, '5': 11, '6': '.ValidatorApi.ValidatorApiError', '10': 'error'},
  ],
};

const GetCurrentVersionRequest$json = const {
  '1': 'GetCurrentVersionRequest',
};

const GetCurrentVersionResponce$json = const {
  '1': 'GetCurrentVersionResponce',
  '2': const [
    const {'1': 'major', '3': 1, '4': 1, '5': 5, '10': 'major'},
    const {'1': 'minor', '3': 2, '4': 1, '5': 5, '10': 'minor'},
  ],
};

const ValidatorApiError$json = const {
  '1': 'ValidatorApiError',
  '2': const [
    const {'1': 'code', '3': 1, '4': 1, '5': 14, '6': '.ValidatorApi.ValidatorApiError.ErrorCodes', '10': 'code'},
    const {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
    const {'1': 'data', '3': 3, '4': 1, '5': 9, '10': 'data'},
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
    const {'1': 'ExpiredApiKey', '2': 6},
  ],
};

