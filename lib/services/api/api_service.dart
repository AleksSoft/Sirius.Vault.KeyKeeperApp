import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grpc/grpc.dart';
import 'package:validator/app/common/app_config_keys.dart';
import 'package:validator/app/common/app_storage_keys.dart';
import 'package:validator/app/utils/utils.dart';
import 'package:validator/src/api.pbgrpc.dart';

class ApiService {
  static const timeoutDuration = const Duration(seconds: 30);

  final _configStorage = GetStorage(AppConfigKeys.config);
  final _remoteConfig = Get.find<RemoteConfig>();

  final Map _clients = Map();

  List<String> apiUrls = [];

  T client<T extends Client>() => _clients[T];

  String get defaultUrl {
    String url = GetStorage(AppConfigKeys.config).read(AppStorageKeys.baseUrl);
    return url.isNullOrBlank ? apiUrls[0] : url;
  }

  static CallOptions getSecureOptions(String apiKey) => CallOptions(
        metadata: {'Authorization': 'Bearer $apiKey'},
        timeout: timeoutDuration,
      );

  Future<ApiService> init() async {
    // init urls from config
    var apiUrlsJson = _remoteConfig.getString(AppConfigKeys.apiUrls);
    apiUrls = (json.decode(apiUrlsJson) as List<dynamic>).cast<String>();
    AppLog.loggerNoStack.i('API urls:\n$apiUrlsJson');

    // update services
    await update();
    return this;
  }

  /// Updates grpc clients with given [url]
  ///
  /// If [url] is null the stored value is used
  Future<void> update({String url}) async {
    if (url.isNullOrBlank) url = defaultUrl;
    await _configStorage.write(AppStorageKeys.baseUrl, url);
    AppLog.loggerNoStack.i('Base Url: $url');

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
