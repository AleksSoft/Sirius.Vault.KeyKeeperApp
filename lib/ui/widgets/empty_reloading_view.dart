import 'dart:ui';

import 'package:validator/app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmptyReloadingView extends StatelessWidget {
  final String emptyHeader;
  final String emptyMessage;
  final Widget child;
  final bool isEmpty;
  final bool isLoading;
  final RefreshCallback onRefresh;

  const EmptyReloadingView({
    @required this.child,
    this.isEmpty,
    this.emptyMessage,
    this.emptyHeader,
    this.isLoading,
    this.onRefresh,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => onRefresh?.call(),
      color: AppColors.dark,
      child: Stack(
        children: <Widget>[
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: isEmpty ?? false
                ? Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          this.emptyHeader ?? '',
                          style: Get.textTheme.button.copyWith(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          this.emptyMessage ?? '',
                          style: Get.textTheme.caption,
                        )
                      ],
                    ),
                  )
                : SizedBox.shrink(),
          ),
          child,
          isLoading != null && isLoading
              ? BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    color: AppColors.light.withOpacity(0.3),
                    height: Get.height,
                    width: Get.width,
                    alignment: Alignment.center,
                    child: Card(
                      shadowColor: AppColors.dark.withOpacity(0.5),
                      elevation: AppSizes.medium,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(AppSizes.medium),
                        ),
                      ),
                      child: SizedBox(
                        height: AppSizes.extraLarge * 3,
                        width: AppSizes.extraLarge * 3,
                        child: AppUiHelpers.progressDark,
                      ),
                    ),
                  ),
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
