import 'package:validator/app/common/app_storage_keys.dart';
import 'package:validator/src/api.pbgrpc.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grpc/grpc.dart';

class ApiService {
  static const List<String> urls = <String>[
    'vault-validator-api.swisschain.io', // default base URL
    'sirius-validator-test.swisschain.info',
    'sirius-validator-dev.swisschain.info',
  ];
  static const timeoutDuration = const Duration(seconds: 60);

  final _configStorage = GetStorage('config');

  final Map _clients = Map();

  Future<ApiService> init() => update().then((_) => this);

  T client<T extends Client>() => _clients[T];

  String get defaultUrl {
    String url = GetStorage('config').read(AppStorageKeys.baseUrl);
    return url.isNullOrBlank ? urls[0] : url;
  }

  static CallOptions getSecureOptions(String apiKey) => CallOptions(
        metadata: {'Authorization': 'Bearer $apiKey'},
        timeout: timeoutDuration,
      );

  /// Updates grpc clients with given [url]
  ///
  /// If [url] is null the stored value is used
  Future<void> update({String url}) async {
    if (url.isNullOrBlank) url = defaultUrl;
    await _configStorage.write(AppStorageKeys.baseUrl, url);
    print('---- Base Url: $url');

    var channel = ClientChannel(url, port: 443);
    var options = CallOptions(timeout: timeoutDuration);

    _recreateClients(channel, options);
  }

  void _recreateClients(ClientChannel channel, CallOptions options) {
    _clients.clear();

    // adding TransfersClient instanses
    _clients.putIfAbsent(
      TransfersClient,
      () => TransfersClient(channel, options: options),
    );

    // adding InvitesClient instanses
    _clients.putIfAbsent(
      InvitesClient,
      () => InvitesClient(channel, options: options),
    );

    // adding VersionClient instanses
    _clients.putIfAbsent(
      VersionClient,
      () => VersionClient(channel, options: options),
    );
  }
}
