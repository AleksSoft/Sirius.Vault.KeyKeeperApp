import 'dart:convert';

import 'package:KeyKeeperApp/models/transfer_detail_model.dart';
import 'package:KeyKeeperApp/src/api.pbenum.dart';
import 'package:enum_to_string/enum_to_string.dart';

class ResolutionDocumentModel {
  TransferDetailModel transferDetail;
  ResolveApprovalRequestsRequest_ResolutionStatus resolution;
  String resolutionMessage;

  ResolutionDocumentModel({
    this.transferDetail,
    this.resolution,
    this.resolutionMessage,
  });

  ResolutionDocumentModel.fromJson(Map<String, dynamic> json) {
    transferDetail = json['TransferDetail'] != null
        ? new TransferDetailModel.fromJson(json['TransferDetail'])
        : null;
    resolution = EnumToString.fromString(
      ResolveApprovalRequestsRequest_ResolutionStatus.values,
      json['Resolution'],
    );
    resolutionMessage = json['ResolutionMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.transferDetail != null) {
      data['TransferDetail'] = this.transferDetail.toJson();
    }
    data['Resolution'] = this.resolution.name;
    data['ResolutionMessage'] = this.resolutionMessage;
    return data;
  }

  @override
  String toString() => json.encode(this.toJson());
}
