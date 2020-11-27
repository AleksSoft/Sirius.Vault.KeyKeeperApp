import 'dart:convert';

import 'package:validator/app/common/app_storage_keys.dart';
import 'package:validator/app/utils/utils.dart';
import 'package:validator/models/saved_errors_model.dart';
import 'package:validator/src/api.pb.dart';
import 'package:validator/ui/pages/root/root_page.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grpc/grpc.dart';

import 'dialog_manager.dart';

typedef Future<T> FutureGenerator<T>();

class ErrorHandler {
  static final _dialogManager = Get.find<DialogManager>();

  static Future<T> safeCall<T>(
    FutureGenerator<T> future, {
    @required String method,
    bool showErrorDialog = true,
  }) async {
    try {
      dynamic response = await future()
          .catchError(
            (e) => _handleGrpcError(e, method, showErrorDialog),
            test: (e) => e is GrpcError,
          )
          .catchError((e) => _handleError(e, method, showErrorDialog));

      try {
        if (response?.error != null && response.error.hasMessage()) {
          _handleApiError(response.error, future, method, showErrorDialog);
          response = null;
        }
      } catch (e) {}
      return response;
    } catch (e) {
      _handleError(e, method, showErrorDialog);
      return null;
    }
  }

  static void _handleApiError(
    ValidatorApiError error,
    FutureGenerator future,
    String method,
    bool showDialog,
  ) {
    if (showDialog) {
      switch (error.code) {
        case ValidatorApiError_ErrorCodes.ExpiredInvitation:
        case ValidatorApiError_ErrorCodes.InternalServerError:
        case ValidatorApiError_ErrorCodes.WrongDeviceInfo:
        case ValidatorApiError_ErrorCodes.WrongInvitation:
        case ValidatorApiError_ErrorCodes.WrongSignature:
        case ValidatorApiError_ErrorCodes.Unknown:
          _dialogManager.error(ErrorContent(
            title: error.code.name,
            message: error.message,
          ));
          break;
        default:
          _defaultErrorDialog();
          break;
      }
    }
    logError(
      code: error.code.name,
      message: error.message,
      method: method,
    );
  }

  static void _handleGrpcError(
    GrpcError e,
    String method,
    bool showDialog,
  ) {
    if (e.code == StatusCode.unauthenticated) {
      _dialogManager.error(
        ErrorContent(
          title: 'Session expired',
          message: 'Please try to log in again.',
          action: () => GetStorage().erase().whenComplete(
                () => Get.offAllNamed(RootPage.route),
              ),
        ),
      );
    }
    logError(
      code: e.code.toString(),
      message: e.message,
      method: method,
    );
  }

  static void _handleError(
    dynamic e,
    String method,
    bool showDialog,
  ) {
    logError(
      code: e.toString(),
      message: '',
      method: method,
    );
    if (showDialog) _defaultErrorDialog();
  }

  static void _defaultErrorDialog() => _dialogManager.error(
        ErrorContent(
            title: 'Oops',
            message: 'Something went wrong. Please try again later.'),
      );

  static void logError({
    @required String code,
    @required String message,
    @required String method,
  }) =>
      AppLog.logger.e('''Error in method: $method
        Code: $code
        Message: $message''');

  static Future<void> saveError({
    @required String code,
    @required String message,
    @required String method,
  }) async {
    final storage = GetStorage();
    String jsonStr = storage.read(AppStorageKeys.errorList);
    SavedErrorsModel model = jsonStr.isNullOrBlank
        ? SavedErrorsModel()
        : SavedErrorsModel().fromJson(json.decode(jsonStr));
    model.errors.add(
      SavedError()
        ..code = code
        ..message = message
        ..method = method
        ..timestamp = DateTime.now().millisecondsSinceEpoch,
    );
    await storage.write(
      AppStorageKeys.errorList,
      json.encode(model.toJson()),
    );
  }
}
