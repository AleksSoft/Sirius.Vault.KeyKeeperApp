import 'package:validator/services/api/api_service.dart';
import 'package:get/get.dart';
import 'package:grpc/grpc.dart';

abstract class BaseRepository<T extends Client> {
  static final _api = Get.find<ApiService>();

  T get client => _api.client<T>();
}
