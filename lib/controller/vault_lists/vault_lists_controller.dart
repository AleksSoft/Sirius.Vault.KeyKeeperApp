import 'package:KeyKeeperApp/models/activation_requests_model.dart';
import 'package:KeyKeeperApp/models/vaults_model.dart';
import 'package:KeyKeeperApp/services/api_service.dart';
import 'package:get/get.dart';

class VaultListsController extends GetxController {
  final _api = Get.find<ApiService>();

  final _modeVaults = true.obs;

  final _vaultsModel = VaultsModel.empty().obs;

  VaultsModel get vaultsModel => this._vaultsModel.value;

  final _requestsModel = ActivationRequestsModel.empty().obs;

  ActivationRequestsModel get requestsModel => this._requestsModel.value;

  List<Vault> get vaults => vaultsModel.items;

  List<ActivationRequest> get requests => requestsModel.items;

  bool get modeVaults => _modeVaults.value;

  set modeVaults(bool isVaultsMode) => _modeVaults.value = isVaultsMode;

  @override
  void onInit() async {
    super.onInit();
    _modeVaults.value = Get.arguments;
    _vaultsModel.value = await _api.fetchVaults();
    _requestsModel.value = await _api.fetchRequests();
  }

  @override
  void onReady() {
    super.onReady();
  }
}
