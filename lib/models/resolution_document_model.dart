import 'dart:convert';

import 'package:KeyKeeperApp/models/transfer_detail_model.dart';
import 'package:KeyKeeperApp/src/api.pbenum.dart';
import 'package:enum_to_string/enum_to_string.dart';

class ResolutionDocumentModel {
  TransferDetailsModel transferDetails;
  ResolveApprovalRequestsRequest_ResolutionStatus resolution;
  String resolutionMessage;

  ResolutionDocumentModel({
    this.transferDetails,
    this.resolution,
    this.resolutionMessage,
  });

  ResolutionDocumentModel.fromJson(Map<String, dynamic> json) {
    transferDetails = json['transferDetails'] != null
        ? new TransferDetailsModel.fromJson(json['transferDetails'])
        : null;
    resolution = EnumToString.fromString(
      ResolveApprovalRequestsRequest_ResolutionStatus.values,
      json['resolution'],
    );
    resolutionMessage = json['resolutionMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.transferDetails != null) {
      data['transferDetails'] = this.transferDetails.toJson();
    }
    data['resolution'] = this.resolution.name;
    data['resolutionMessage'] = this.resolutionMessage;
    return data;
  }

  @override
  String toString() => json.encode(this.toJson());
}
