import 'package:validator/app/utils/utils.dart';
import 'package:validator/models/transfer_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionTypeChip extends StatelessWidget {
  const TransactionTypeChip(
    this.r, {
    this.showLabel = true,
    Key key,
  }) : super(key: key);

  final TransferDetailsModel r;
  final bool showLabel;

  @override
  Widget build(BuildContext context) {
    return Chip(
      padding: const EdgeInsets.all(AppSizes.extraSmall),
      label: Visibility(
        visible: showLabel,
        child: Text(
          r.addressLabel,
          style: Get.textTheme.caption.copyWith(
            color: AppColors.primary,
          ),
        ),
      ),
      backgroundColor: r.isExternal ? AppColors.red : AppColors.green,
      elevation: 0,
      avatar: Icon(
        r.isExternal ? Icons.file_upload : Icons.file_download,
        color: AppColors.primary,
        size: 18,
      ),
    );
  }
}
