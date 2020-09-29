import 'package:KeyKeeperApp/services/utils/error_handler.dart';
import 'package:KeyKeeperApp/src/api.pbgrpc.dart';
import 'package:flutter/foundation.dart';

import 'base_repository.dart';

class InvitesRepository extends BaseRepository<InvitesClient> {
  Future<AcceptResponse> accept({
    @required String validatorId,
    @required String deviceInfo,
    @required String inviteId,
  }) async =>
      await ErrorHandler.safeCall(
        () => client.accept(
          AcceptRequest()
            ..validatorId = validatorId
            ..deviceInfo = deviceInfo
            ..inviteId,
        ),
        method: 'accept',
      );

  Future<AcceptResponse> getPing({
    @required String validatorId,
    @required String deviceInfo,
    @required String inviteId,
  }) async =>
      await ErrorHandler.safeCall(
        () => clientSecured.getPing(PingRequest()..deviceInfo = deviceInfo),
        method: 'getPing',
      );
}
