import 'dart:convert';
import 'dart:io';

import 'package:KeyKeeperApp/models/activation_requests_model.dart';
import 'package:KeyKeeperApp/models/vaults_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://sirius.swisschain.io/api';

  static const String requestsEndpoint = '/vault-activation-requests';
  static const String vaultsEndpoint = '/vaults';

  String get usedBearer =>
      'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsic3dpc3NjaGFpbi5pbyIsInNpcml1cy5zd2lzc2NoYWluLmlvIiwiZXhjaGFuZ2Uuc3dpc3NjaGFpbi5pbyJdLCJ1c2VyLWlkIjoiNTM0ZDAzYmYtM2M4NS00ODA2LWFjYjctZmNjZDRkMzdmODAxIiwidGVuYW50LWlkIjoiNzVmZDY2MWItZDZiNC00MGFjLWFmMWUtNDE0YTc2YzU5OWNlIiwibmJmIjoxNTk1MzExMDk5LCJleHAiOjE1OTU5MTU4OTksImlhdCI6MTU5NTMxMTA5OX0.KlhJdW2VgoxaVTEFLQIa-CIwtcJhbEOmJ2YZYxVR4FE';

  Future<VaultsModel> fetchVaults() async {
    final response = await http.get(
      baseUrl + vaultsEndpoint,
      headers: {HttpHeaders.authorizationHeader: usedBearer},
    );

    if (response.statusCode == 200) {
      var jsonStr = json.decode(response.body);
      print(jsonStr);
      return VaultsModel.fromJson(jsonStr);
    } else {
      Future.delayed(Duration()).then((_) {
        Get.defaultDialog(
          title: 'Vaults Error ${response.statusCode ?? ''}',
          middleText: response.reasonPhrase ?? 'Something wrong',
          buttonColor: Colors.black,
          onConfirm: () => Get.back(),
        );
      });
      return VaultsModel.empty();
    }
  }

  Future<ActivationRequestsModel> fetchRequests() async {
    final response = await http.get(
      baseUrl + requestsEndpoint,
      headers: {HttpHeaders.authorizationHeader: usedBearer},
    );

    if (response.statusCode == 200) {
      var jsonStr = json.decode(response.body);
      print(jsonStr);
      return ActivationRequestsModel.fromJson(jsonStr);
    } else {
      Future.delayed(Duration()).then((_) {
        Get.defaultDialog(
          title: 'Activation Requests Error ${response.statusCode ?? ''}',
          middleText: response.reasonPhrase ?? 'Something wrong',
          buttonColor: Colors.black,
          onConfirm: () => Get.back(),
        );
      });
      return ActivationRequestsModel.empty();
    }
  }
}
