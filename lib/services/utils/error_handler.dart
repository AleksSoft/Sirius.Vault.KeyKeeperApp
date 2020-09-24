import 'dart:convert';

import 'package:KeyKeeperApp/app/common/app_storage_keys.dart';
import 'package:KeyKeeperApp/models/saved_errors_model.dart';
import 'package:KeyKeeperApp/services/api/api_service.dart';
import 'package:KeyKeeperApp/src/api.pb.dart';
import 'package:KeyKeeperApp/ui/pages/root/root_page.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grpc/grpc.dart';

typedef Future<T> FutureGenerator<T>();

class ErrorHandler {
  static Future safeCall(FutureGenerator future,
      {@required String method}) async {
    dynamic response = await future()
        .timeout(ApiService.timeoutDuration)
        .catchError(
          (e) => _handleGrpcError(e, method),
          test: (e) => e is GrpcError,
        )
        .catchError((e) async => await _handleError(e, method));
    try {
      if (response?.error != null && response.error.hasMessage()) {
        await _handleApiError(response.error, future, method);
        return response;
      }
    } catch (e) {
      return response;
    }
    return response;
  }

  static _handleApiError(
    ValidatorApiError error,
    FutureGenerator future,
    String method,
  ) async =>
      await saveError(
        code: EnumToString.convertToString(error.code),
        message: error.message,
        method: method,
      );

  static _handleGrpcError(GrpcError e, String method) async {
    if (e.code == StatusCode.unauthenticated) {
      GetStorage().erase().whenComplete(
            () => Get.offAllNamed(RootPage.route),
          );
    }
    await saveError(
      code: e.code.toString(),
      message: e.message,
      method: method,
    );
  }

  static _handleError(dynamic e, String method) async => await saveError(
        code: '',
        message: e.message,
        method: method,
      );

  static saveError({
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
