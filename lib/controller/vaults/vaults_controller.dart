import 'package:get/get.dart';

class VaultsController extends GetxController {
  static VaultsController get con => Get.find();

  var vaults = <String>[];

  @override
  void onReady() async {
    await loadVaults();
    super.onReady();
  }

  Future<void> loadVaults() async {}

  openDetails() => Get.toNamed('');
}
