import 'package:KeyKeeperApp/services/api/api_service.dart';
import 'package:KeyKeeperApp/services/utils/error_handler.dart';
import 'package:KeyKeeperApp/src/api.pbgrpc.dart';
import 'package:flutter/foundation.dart';

import 'base_repository.dart';

class InvitesRepository extends BaseRepository<InvitesClient> {
  Future<AcceptResponse> accept({
    @required String publicKeyPem,
    @required String validatorId,
    @required String deviceInfo,
    @required String inviteId,
  }) async =>
      await ErrorHandler.safeCall(
        () => client.accept(
          AcceptRequest()
            ..publicKeyPem = publicKeyPem
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
    @required String apiKey,
  }) async =>
      await ErrorHandler.safeCall(
        () => client.getPing(
          PingRequest()..deviceInfo = deviceInfo,
          options: ApiService.getSecureOptions(apiKey),
        ),
        method: 'getPing',
      );
}
