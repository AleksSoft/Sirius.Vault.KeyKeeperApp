import 'dart:convert';

import 'package:equatable/equatable.dart';

class DeviceInfoModel with EquatableMixin {
  String deviceUID;
  String platform;

  DeviceInfoModel({this.deviceUID, this.platform});

  DeviceInfoModel.fromJson(Map<String, dynamic> json) {
    deviceUID = json['deviceUID'];
    platform = json['platform'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['deviceUID'] = this.deviceUID;
    data['platform'] = this.platform;
    return data;
  }

  @override
  List<Object> get props => [deviceUID, platform];

  @override
  String toString() => json.encode(this.toJson());
}
