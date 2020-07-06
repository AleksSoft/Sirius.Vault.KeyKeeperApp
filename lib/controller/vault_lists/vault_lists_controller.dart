import 'package:KeyKeeperApp/models/activation_requests_model.dart';
import 'package:KeyKeeperApp/models/vaults_model.dart';
import 'package:KeyKeeperApp/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VaultListsController extends GetxController {
  static const List<String> vaultStatusList = [
    'all',
    'offline',
    'initializing',
    'activating',
    'active',
  ];

  final _api = Get.find<ApiService>();

  final _filterStatus = vaultStatusList[0].obs;

  get filterStatus => this._filterStatus.value;

  set filterStatus(value) => this._filterStatus.value = value;

  final _modeVaults = true.obs;

  final _vaultsModel = VaultsModel.empty().obs;

  VaultsModel get vaultsModel => this._vaultsModel.value;

  final _requestsModel = ActivationRequestsModel.empty().obs;

  ActivationRequestsModel get requestsModel => this._requestsModel.value;

  List<Vault> get vaults => _filterStatus.value == vaultStatusList[0]
      ? vaultsModel.items
      : vaultsModel.items
          .where((item) => item.status == _filterStatus.value)
          .toList();

  List<ActivationRequest> get requests => requestsModel.items;

  bool get modeVaults => _modeVaults.value;

  set modeVaults(bool isVaultsMode) => _modeVaults.value = isVaultsMode;

  @override
  void onInit() {
    super.onInit();
    _modeVaults.value = Get.arguments as bool;
    reload();
  }

  @override
  void onReady() {
    super.onReady();
  }

  reload() async {
    _vaultsModel.value = await _api.fetchVaults();
    _requestsModel.value = await _api.fetchRequests();
  }

  Color getStatusColor(String status) {
    if (status == vaultStatusList[1]) {
      return Colors.red;
    } else if (status == vaultStatusList[2]) {
      return Colors.grey;
    } else if (status == vaultStatusList[3]) {
      return Colors.yellow[800];
    } else if (status == vaultStatusList[4]) {
      return Colors.green;
    }
    return Colors.black;
  }
}
