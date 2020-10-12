import 'package:validator/app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmptyReloadingHelper extends StatelessWidget {
  final String emptyHeader;
  final String emptyMessage;
  final Widget child;
  final bool showEmptyContidion;
  final bool isLoading;
  final RefreshCallback onRefresh;

  const EmptyReloadingHelper({
    @required this.child,
    this.showEmptyContidion,
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
            child: showEmptyContidion ?? false
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
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: isLoading != null && isLoading
                ? AppUiHelpers.linearProgress
                : SizedBox.shrink(),
          ),
          child,
        ],
      ),
    );
  }
}
