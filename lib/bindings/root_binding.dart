import 'package:KeyKeeperApp/controller/home/pages/requests/requests_controller.dart';
import 'package:KeyKeeperApp/services/utils/dialog_manager.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  dependencies() {
    Get.put<DialogManager>(DialogManager());
    Get.put<RequestsController>(RequestsController());
  }
}
