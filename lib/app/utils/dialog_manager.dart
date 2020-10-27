import 'dart:collection';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:validator/app/common/common.dart';

import 'app_log.dart';

class DialogManager {
  ListQueue<ErrorContent> _errorsQueue = ListQueue<ErrorContent>();

  error(ErrorContent content) {
    if (content != null) {
      ErrorContent existingContent = _errorsQueue.firstWhere(
        (e) => e == content,
        orElse: () => null,
      );
      if (existingContent == null) {
        _errorsQueue.add(content);
        _checkNext();
      }
    }
  }

  _checkNext() async {
    try {
      ErrorContent content = _errorsQueue.first;
      Get.defaultDialog(
        title: content?.title ?? '',
        middleText: content?.message ?? '',
        buttonColor: AppColors.red,
        confirmTextColor: AppColors.primary,
        onConfirm: () {
          Get.back();
          content?.action?.call();
          _errorsQueue.remove(content);
          _checkNext();
        },
      );
    } catch (e) {
      AppLog.logger.e(e);
    }
  }
}

class ErrorContent with EquatableMixin {
  String title;
  String message;
  VoidCallback action;

  ErrorContent({
    this.title,
    @required this.message,
    this.action,
  });

  @override
  List<Object> get props => [title, message];
}
