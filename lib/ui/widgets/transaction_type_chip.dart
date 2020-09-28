import 'package:KeyKeeperApp/app/ui/app_colors.dart';
import 'package:KeyKeeperApp/app/ui/app_sizes.dart';
import 'package:KeyKeeperApp/models/transfer_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionTypeChip extends StatelessWidget {
  const TransactionTypeChip(this.r, {Key key}) : super(key: key);

  final TransferDetailModel r;

  @override
  Widget build(BuildContext context) {
    return Chip(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.small,
      ),
      label: Text(
        r.addressLabel,
        style: Get.textTheme.button.copyWith(
          color: AppColors.primary,
        ),
      ),
      backgroundColor: r.isExternal ? AppColors.red : AppColors.green,
      elevation: 0,
      avatar: Icon(
        r.isExternal ? Icons.file_upload : Icons.file_download,
        color: AppColors.primary,
      ),
    );
  }
}
