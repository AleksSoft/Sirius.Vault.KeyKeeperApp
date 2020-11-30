import 'package:validator/app/utils/utils.dart';
import 'package:validator/services/api/api_service.dart';
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
      await ErrorHandler.safeCall<AcceptResponse>(
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
      await ErrorHandler.safeCall<PingResponse>(
        () => client.getPing(
          PingRequest()..deviceInfo = deviceInfo,
          options: ApiService.getSecureOptions(apiKey),
        ),
        method: 'getPing',
      );

  Future<RemoveVaultConnectionResponse> removeVaultConnection(
          {@required String apiKey}) async =>
      await ErrorHandler.safeCall<RemoveVaultConnectionResponse>(
        () => client.removeVaultConnection(
          RemoveVaultConnectionRequest(),
          options: ApiService.getSecureOptions(apiKey),
        ),
        method: 'removeVaultConnection',
      );

  Future<RefreshPushNotificationFCMTokenResponse>
      refreshPushNotificationFCMToken({
    @required String pushNotificationFCMToken,
    @required String apiKey,
  }) async =>
          await ErrorHandler.safeCall<RefreshPushNotificationFCMTokenResponse>(
            () => client.refreshPushNotificationFCMToken(
              RefreshPushNotificationFCMTokenRequest()
                ..pushNotificationFCMToken = pushNotificationFCMToken,
              options: ApiService.getSecureOptions(apiKey),
            ),
            method: 'refreshPushNotificationFCMToken',
          );
}
