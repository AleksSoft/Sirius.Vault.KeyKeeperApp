import 'package:validator/services/api/api_service.dart';
import 'package:validator/services/utils/error_handler.dart';
import 'package:validator/src/api.pbgrpc.dart';
import 'package:flutter/foundation.dart';

import 'base_repository.dart';

class InvitesRepository extends BaseRepository<InvitesClient> {
  Future<AcceptResponse> accept({
    @required String publicKeyPem,
    @required String validatorId,
    @required String deviceInfo,
    @required String inviteId,
    @required String pushNotificationFCMToken,
  }) async =>
      await ErrorHandler.safeCall(
        () => client.accept(
          AcceptRequest()
            ..publicKeyPem = publicKeyPem
            ..validatorId = validatorId
            ..deviceInfo = deviceInfo
            ..inviteId = inviteId
            ..pushNotificationFCMToken = pushNotificationFCMToken,
        ),
        method: 'accept',
      );

  Future<PingResponse> getPing({
    @required String deviceInfo,
    @required String apiKey,
  }) async =>
      await ErrorHandler.safeCall(
        () => client.getPing(
          PingRequest()..deviceInfo = deviceInfo,
          options: ApiService.getSecureOptions(apiKey),
        ),
        method: 'getPing',
      );

  Future<RemoveVaultConnectionResponse> removeVaultConnection(
          {@required String apiKey}) async =>
      await ErrorHandler.safeCall(
        () => client.removeVaultConnection(
          RemoveVaultConnectionRequest(),
          options: ApiService.getSecureOptions(apiKey),
        ),
        method: 'removeVaultConnection',
      );
}
