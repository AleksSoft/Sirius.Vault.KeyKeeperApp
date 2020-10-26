import 'package:validator/services/api/api_service.dart';
import 'package:validator/services/utils/error_handler.dart';
import 'package:validator/src/api.pb.dart';
import 'package:validator/src/api.pbgrpc.dart';
import 'package:flutter/foundation.dart';

import 'base_repository.dart';

class TransfersRepository extends BaseRepository<TransfersClient> {
  Future<List<GetApprovalRequestsResponse_ApprovalRequest>>
      getApprovalRequests({
    @required String deviceInfo,
    @required String apiKey,
    bool showErrorDialog = true,
  }) async {
    final response = await ErrorHandler.safeCall<GetApprovalRequestsResponse>(
      () => client.getApprovalRequests(
        GetApprovalRequestsRequests()..deviceInfo = deviceInfo,
        options: ApiService.getSecureOptions(apiKey),
      ),
      showErrorDialog: showErrorDialog,
      method: 'getApprovalRequests',
    );
    return response?.payload ?? [];
  }

  Future<bool> resolveApprovalRequest({
    @required String deviceInfo,
    @required String transferSigningRequestId,
    @required String resolutionDocumentEnc,
    @required String signature,
    @required String apiKey,
  }) async {
    final response =
        await ErrorHandler.safeCall<ResolveApprovalRequestsResponse>(
      () => client.resolveApprovalRequests(
        ResolveApprovalRequestsRequest()
          ..deviceInfo = deviceInfo
          ..transferSigningRequestId = transferSigningRequestId
          ..resolutionDocumentEncBase64 = resolutionDocumentEnc
          ..signature = signature,
        options: ApiService.getSecureOptions(apiKey),
      ),
      method: 'resolveApprovalRequests',
    );
    return response != null;
  }
}
