import 'package:validator/app/utils/utils.dart';
import 'package:validator/models/transfer_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NetworkChip extends StatelessWidget {
  const NetworkChip(this.r, {Key key}) : super(key: key);

  final TransferDetailsModel r;

  @override
  Widget build(BuildContext context) {
    return Chip(
      padding: const EdgeInsets.all(AppSizes.extraSmall),
      label: Text(
        r.networkType ?? '',
        style: Get.textTheme.caption.copyWith(
          color: AppColors.primary,
        ),
      ),
      backgroundColor: r.networkInsecure ? AppColors.red : AppColors.green,
      elevation: 0,
    );
  }
}
