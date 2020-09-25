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

  Future<bool> resolveApprovalRequests({
    @required String deviceInfo,
    @required String transferSigningRequestId,
    @required String resolutionMessage,
    @required String signature,
    @required ResolveApprovalRequestsRequest_ResolutionStatus resolution,
  }) async {
    final response = await ErrorHandler.safeCall(
      () => clientSecured.resolveApprovalRequests(
        ResolveApprovalRequestsRequest()
          ..deviceInfo = deviceInfo
          ..transferSigningRequestId = transferSigningRequestId
          ..resolutionMessage = resolutionMessage
          ..signature = signature
          ..resolution = resolution,
      ),
      method: 'resolveApprovalRequests',
    );
    return response != null;
  }
}
