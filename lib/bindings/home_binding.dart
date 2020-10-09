import 'package:KeyKeeperApp/controller/controllers.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  dependencies() {
    Get.put<HomeController>(HomeController());
    Get.put<RequestsController>(RequestsController());
  }
}
