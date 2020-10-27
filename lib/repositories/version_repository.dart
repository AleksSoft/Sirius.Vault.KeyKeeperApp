import 'package:validator/utils/error_handler.dart';
import 'package:validator/src/api.pbgrpc.dart';

import 'base_repository.dart';

class VersionRepository extends BaseRepository<VersionClient> {
  Future<GetCurrentVersionResponce> getCurrentVersion() =>
      ErrorHandler.safeCall<GetCurrentVersionResponce>(
        () => client.getCurrentVersion(GetCurrentVersionRequest()),
        method: 'getCurrentVersion',
      );
}
