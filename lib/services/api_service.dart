import 'dart:convert';
import 'dart:io';

import 'package:KeyKeeperApp/models/activation_requests_model.dart';
import 'package:KeyKeeperApp/models/vaults_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://sirius.swisschain.io/api';
  static const List<String> bearers = [
    'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJzaXJpdXMuc3dpc3NjaGFpbi5pbyIsInRlbmFudC1pZCI6IjkzMzQzMGNiLTMyYjItNGNkNi05M2ZkLWE5MzRmODYzYTFiNSIsInVuaXF1ZV9uYW1lIjoia2V5LWtlZXBlci0xIiwia2V5LWtlZXBlci1pZCI6IjEwMDAxMSIsIm5iZiI6MTU5Mjg4ODE0MywiZXhwIjoxNTk4ODIxMjAwLCJpYXQiOjE1OTI4ODgxNDN9.uR9FSMP_sDzLrz4bHxyWOScKnh9S7hH9UxglNLhuTq0',
    'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJzaXJpdXMuc3dpc3NjaGFpbi5pbyIsInRlbmFudC1pZCI6IjkzMzQzMGNiLTMyYjItNGNkNi05M2ZkLWE5MzRmODYzYTFiNSIsInVuaXF1ZV9uYW1lIjoia2V5LWtlZXBlci0yIiwia2V5LWtlZXBlci1pZCI6IjEwMDAxMiIsIm5iZiI6MTU5Mjg4ODE0MywiZXhwIjoxNTk4ODIxMjAwLCJpYXQiOjE1OTI4ODgxNDN9.mn9_1p9xtmNJsDIwm2apkLuITH391bn8u_G7ArIeYZU',
    'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJzaXJpdXMuc3dpc3NjaGFpbi5pbyIsInRlbmFudC1pZCI6IjkzMzQzMGNiLTMyYjItNGNkNi05M2ZkLWE5MzRmODYzYTFiNSIsInVuaXF1ZV9uYW1lIjoia2V5LWtlZXBlci0zIiwia2V5LWtlZXBlci1pZCI6IjEwMDAxNCIsIm5iZiI6MTU5Mjg4ODE0MywiZXhwIjoxNTk4ODIxMjAwLCJpYXQiOjE1OTI4ODgxNDN9.0tLASygrwLAKGUPD0RGcihZq40xHnxXyMYLUDM_jnDg',
    'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJzaXJpdXMuc3dpc3NjaGFpbi5pbyIsInRlbmFudC1pZCI6IjkzMzQzMGNiLTMyYjItNGNkNi05M2ZkLWE5MzRmODYzYTFiNSIsInVuaXF1ZV9uYW1lIjoia2V5LWtlZXBlci00Iiwia2V5LWtlZXBlci1pZCI6IjEwMDAxNSIsIm5iZiI6MTU5Mjg4ODE0MywiZXhwIjoxNTk4ODIxMjAwLCJpYXQiOjE1OTI4ODgxNDN9.QAw0wTPgHAecOvv85CUesY_PXyoYCs0w1qT8BjgnJa4',
    'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJzaXJpdXMuc3dpc3NjaGFpbi5pbyIsInRlbmFudC1pZCI6IjkzMzQzMGNiLTMyYjItNGNkNi05M2ZkLWE5MzRmODYzYTFiNSIsInVuaXF1ZV9uYW1lIjoia2V5LWtlZXBlci01Iiwia2V5LWtlZXBlci1pZCI6IjEwMDAxNiIsIm5iZiI6MTU5Mjg4ODE0MywiZXhwIjoxNTk4ODIxMjAwLCJpYXQiOjE1OTI4ODgxNDN9.e3Y_GRVLEfdwG6g5_omTB6YBJvu-cLJai9da6Gy0Vj8',
    'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJzaXJpdXMuc3dpc3NjaGFpbi5pbyIsInRlbmFudC1pZCI6IjkzMzQzMGNiLTMyYjItNGNkNi05M2ZkLWE5MzRmODYzYTFiNSIsInVuaXF1ZV9uYW1lIjoia2V5LWtlZXBlci02Iiwia2V5LWtlZXBlci1pZCI6IjEwMDAxNyIsIm5iZiI6MTU5Mjg4ODE0MywiZXhwIjoxNTk4ODIxMjAwLCJpYXQiOjE1OTI4ODgxNDN9.g6SkC6Nv',
  ];

  static const String requestsEndpoint = '/vault-activation-requests';
  static const String vaultsEndpoint = '/vaults';

  Future<VaultsModel> fetchVaults() async {
    final response = await http.get(
      baseUrl + vaultsEndpoint,
      headers: {HttpHeaders.authorizationHeader: bearers[0]},
    );

    if (response.statusCode == 200) {
      var jsonStr = json.decode(response.body);
      print(jsonStr);
      return VaultsModel.fromJson(jsonStr);
    } else {
      throw Exception('!!!!FAILED to load vaults with code: '
          '${response.statusCode}');
    }
  }

  Future<ActivationRequestsModel> fetchRequests() async {
    final response = await http.get(
      baseUrl + requestsEndpoint,
      headers: {HttpHeaders.authorizationHeader: bearers[0]},
    );

    if (response.statusCode == 200) {
      var jsonStr = json.decode(response.body);
      print(jsonStr);
      return ActivationRequestsModel.fromJson(jsonStr);
    } else {
      throw Exception('!!!!FAILED to load vaults with code: '
          '${response.statusCode}');
    }
  }
}
