import 'package:validator/app/utils/utils.dart';
import 'package:validator/src/api.pbgrpc.dart';

import 'base_repository.dart';

class VersionRepository extends BaseRepository<VersionClient> {
  Future<GetCurrentVersionResponce> getCurrentVersion() =>
      ErrorHandler.safeCall<GetCurrentVersionResponce>(
        () => client.getCurrentVersion(GetCurrentVersionRequest()),
        method: 'getCurrentVersion',
      );
}
