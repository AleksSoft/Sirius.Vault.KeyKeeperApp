import 'package:KeyKeeperApp/services/utils/error_handler.dart';
import 'package:KeyKeeperApp/src/api.pb.dart';
import 'package:KeyKeeperApp/src/api.pbgrpc.dart';
import 'package:flutter/foundation.dart';

import 'base_repository.dart';

class TransfersRepository extends BaseRepository<TransfersClient> {
  Future<List<GetApprovalRequestsResponse_ApprovalRequest>> getApprovalRequests(
      {@required String deviceInfo}) async {
    GetApprovalRequestsResponse response = await ErrorHandler.safeCall(
      () => clientSecured.getApprovalRequests(
        GetApprovalRequestsRequests()..deviceInfo = deviceInfo,
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
  }) async {
    final response = await ErrorHandler.safeCall(
      () => clientSecured.resolveApprovalRequests(
        ResolveApprovalRequestsRequest()
          ..deviceInfo = deviceInfo
          ..transferSigningRequestId = transferSigningRequestId
          ..resolutionDocumentEncBase64 = resolutionDocumentEnc
          ..signature = signature,
      ),
      method: 'resolveApprovalRequests',
    );
    return response != null;
  }
}
