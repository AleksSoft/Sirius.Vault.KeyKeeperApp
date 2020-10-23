import 'dart:convert';

import 'transfer_detail_model.dart';

class ResolutionDocumentModel {
  TransferDetailModel transferDetails;
  String resolution;
  String resolutionMessage;

  ResolutionDocumentModel({
    this.transferDetails,
    this.resolution,
    this.resolutionMessage,
  });

  ResolutionDocumentModel.fromJson(Map<String, dynamic> json) {
    transferDetails = json['transferDetails'] != null
        ? new TransferDetailModel.fromJson(json['transferDetails'])
        : null;
    resolution = json['resolution'];
    resolutionMessage = json['resolutionMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.transferDetails != null) {
      data['transferDetails'] = this.transferDetails.toJson();
    }
    data['resolution'] = this.resolution;
    data['resolutionMessage'] = this.resolutionMessage;
    return data;
  }

  @override
  String toString() => json.encode(this.toJson());
}
