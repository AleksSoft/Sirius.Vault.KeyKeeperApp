import 'dart:convert';

import 'package:KeyKeeperApp/app/common/app_storage_keys.dart';
import 'package:KeyKeeperApp/models/saved_errors_model.dart';
import 'package:KeyKeeperApp/services/api/api_service.dart';
import 'package:KeyKeeperApp/services/utils/dialog_manager.dart';
import 'package:KeyKeeperApp/src/api.pb.dart';
import 'package:KeyKeeperApp/ui/pages/root/root_page.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grpc/grpc.dart';

typedef Future<T> FutureGenerator<T>();

class ErrorHandler {
  static final _dialogManager = Get.find<DialogManager>();

  static Future safeCall(
    FutureGenerator future, {
    @required String method,
    bool hideErrorDialog = false,
  }) async {
    dynamic response = await future()
        .timeout(ApiService.timeoutDuration)
        .catchError(
          (e) => _handleGrpcError(e, method),
          test: (e) => e is GrpcError,
        )
        .catchError((e) => _handleError(e, method));

    try {
      if (response?.error != null && response.error.hasMessage()) {
        _handleApiError(response.error, future, method);
        response = null;
      }
    } catch (e) {}
    return response;
  }

  static Future<void> _handleApiError(
    ValidatorApiError error,
    FutureGenerator future,
    String method,
  ) async {
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
        _defaultError();
        break;
    }
    await saveError(
      code: error.code.name,
      message: error.message,
      method: method,
    );
  }

  static Future<void> _handleGrpcError(GrpcError e, String method) async {
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
    await saveError(
      code: e.code.toString(),
      message: e.message,
      method: method,
    );
  }

  static void _handleError(dynamic e, String method) => saveError(
        code: e.runtimeType.toString(),
        message: '',
        method: method,
      ).whenComplete(() => _defaultError());

  static void _defaultError() => _dialogManager.error(
        ErrorContent(
            title: 'Oops',
            message: 'Something went wrong. Please try again later.'),
      );

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
