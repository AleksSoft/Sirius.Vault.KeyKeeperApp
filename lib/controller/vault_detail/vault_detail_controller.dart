import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VaultDetailController extends GetxController {
  static VaultDetailController get con => Get.find();

  final localNameController = TextEditingController();

  bool get stausOk => false;
}
