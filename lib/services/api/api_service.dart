import 'package:KeyKeeperApp/app/common/app_storage_keys.dart';
import 'package:KeyKeeperApp/src/api.pbgrpc.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grpc/grpc.dart';

class ApiService {
  static final List<String> urls = <String>[
    // 'vault-validator-api.swisschain.io',
    'sirius-validator-dev.swisschain.info',
    // 'vault-validator-api-test.swisschain.info',
  ];
  static final timeoutDuration = const Duration(seconds: 60);
  final _storage = GetStorage();

  final Map _clients = Map();
  final Map _clientsSecured = Map();

  T client<T extends Client>() => _clients[T];
  T clientSecured<T extends Client>() => _clientsSecured[T];

  static String get defaultUrl {
    String url = GetStorage().read(AppStorageKeys.baseUrl);
    return url.isNullOrBlank ? urls[0] : url;
  }

  /// Updates grpc clients with given [url]
  ///
  /// If [url] is null the stored value is used
  Future<void> update({String url}) async {
    if (url.isNullOrBlank) url = defaultUrl;
    await _storage.write(AppStorageKeys.baseUrl, url);
    print('---- Base Url: $url');

    var channel = ClientChannel(url, port: 443);
    var securedOptions = CallOptions(
      metadata: {
        'Authorization': 'Bearer ${_storage.read(AppStorageKeys.token)}',
      },
      timeout: timeoutDuration,
    );
    var options = CallOptions(timeout: timeoutDuration);

    _recreateClients(channel, securedOptions, options);
  }

  void _recreateClients(
    ClientChannel channel,
    CallOptions securedOptions,
    CallOptions options,
  ) {
    _clients.clear();
    _clientsSecured.clear();

    // adding TransfersClient instanses
    _clients.putIfAbsent(
      TransfersClient,
      () => TransfersClient(channel, options: options),
    );
    _clientsSecured.putIfAbsent(
      TransfersClient,
      () => TransfersClient(channel, options: securedOptions),
    );

    // adding InvitesClient instanses
    _clients.putIfAbsent(
      InvitesClient,
      () => InvitesClient(channel, options: options),
    );
    _clientsSecured.putIfAbsent(
      InvitesClient,
      () => InvitesClient(channel, options: securedOptions),
    );
  }
}
