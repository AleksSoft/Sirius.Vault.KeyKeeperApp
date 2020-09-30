import 'package:KeyKeeperApp/services/api/api_service.dart';
import 'package:KeyKeeperApp/services/utils/error_handler.dart';
import 'package:KeyKeeperApp/src/api.pb.dart';
import 'package:KeyKeeperApp/src/api.pbgrpc.dart';
import 'package:flutter/foundation.dart';

import 'base_repository.dart';

class TransfersRepository extends BaseRepository<TransfersClient> {
  Future<List<GetApprovalRequestsResponse_ApprovalRequest>> getApprovalRequests(
      {@required String deviceInfo, @required String apiKey}) async {
    GetApprovalRequestsResponse response = await ErrorHandler.safeCall(
      () => client.getApprovalRequests(
        GetApprovalRequestsRequests()..deviceInfo = deviceInfo,
        options: ApiService.getSecureOptions(apiKey),
      ),
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
    final response = await ErrorHandler.safeCall(
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
