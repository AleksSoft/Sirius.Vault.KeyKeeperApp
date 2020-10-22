import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:intl/intl.dart';

class TransferDetailModel {
  int operationId;
  Blockchain blockchain;
  Asset asset;
  SourceAddress sourceAddress;
  DestinationAddress destinationAddress;
  double amount;
  double feeLimit;
  TransferContext transferContext;

  bool get networkInsecure =>
      'mainnet' == (blockchain?.networkType ?? '').toLowerCase();
  bool get isExternal => sourceAddress?.group != destinationAddress?.group;
  String get addressLabel => isExternal ? 'External' : 'Internal';

  TransferDetailModel(
      {this.operationId,
      this.blockchain,
      this.asset,
      this.sourceAddress,
      this.destinationAddress,
      this.amount,
      this.feeLimit,
      this.transferContext});

  TransferDetailModel.fromJson(Map<String, dynamic> json) {
    operationId = json['operationId'];
    blockchain = json['blockchain'] != null
        ? new Blockchain.fromJson(json['blockchain'])
        : null;
    asset = json['asset'] != null ? new Asset.fromJson(json['asset']) : null;
    sourceAddress = json['sourceAddress'] != null
        ? new SourceAddress.fromJson(json['sourceAddress'])
        : null;
    destinationAddress = json['destinationAddress'] != null
        ? new DestinationAddress.fromJson(json['destinationAddress'])
        : null;
    amount = json['amount'];
    feeLimit = json['feeLimit'];
    transferContext = json['transferContext'] != null
        ? new TransferContext.fromJson(json['transferContext'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['operationId'] = this.operationId;
    if (this.blockchain != null) {
      data['blockchain'] = this.blockchain.toJson();
    }
    if (this.asset != null) {
      data['asset'] = this.asset.toJson();
    }
    if (this.sourceAddress != null) {
      data['sourceAddress'] = this.sourceAddress.toJson();
    }
    if (this.destinationAddress != null) {
      data['destinationAddress'] = this.destinationAddress.toJson();
    }
    data['amount'] = this.amount;
    data['feeLimit'] = this.feeLimit;
    if (this.transferContext != null) {
      data['transferContext'] = this.transferContext.toJson();
    }
    return data;
  }
}

class Blockchain {
  String id;
  String protocolId;
  String networkType;

  Blockchain({this.id, this.protocolId, this.networkType});

  Blockchain.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    protocolId = json['protocolId'];
    networkType = json['networkType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['protocolId'] = this.protocolId;
    data['networkType'] = this.networkType;
    return data;
  }
}

class Asset {
  int id;
  String symbol;
  String address;

  Asset({this.id, this.symbol, this.address});

  Asset.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    symbol = json['symbol'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['symbol'] = this.symbol;
    data['address'] = this.address;
    return data;
  }
}

class SourceAddress {
  String address;
  Null name;
  String group;

  SourceAddress({this.address, this.name, this.group});

  SourceAddress.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    name = json['name'];
    group = json['group'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['name'] = this.name;
    data['group'] = this.group;
    return data;
  }
}

class DestinationAddress {
  String address;
  String name;
  String group;
  String tag;
  String tagType;

  DestinationAddress(
      {this.address, this.name, this.group, this.tag, this.tagType});

  DestinationAddress.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    name = json['name'];
    group = json['group'];
    tag = json['tag'];
    tagType = json['tagType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['name'] = this.name;
    data['group'] = this.group;
    data['tag'] = this.tag;
    data['tagType'] = this.tagType;
    return data;
  }
}

class TransferContext {
  String document;
  String signature;
  String accountReferenceId;
  String withdrawalReferenceId;
  String component;
  String operationType;
  String sourceGroup;
  String destinationGroup;
  RequestContext requestContext;

  TransferContext(
      {this.document,
      this.signature,
      this.accountReferenceId,
      this.withdrawalReferenceId,
      this.component,
      this.operationType,
      this.sourceGroup,
      this.destinationGroup,
      this.requestContext});

  TransferContext.fromJson(Map<String, dynamic> json) {
    document = json['document'];
    signature = json['signature'];
    accountReferenceId = json['accountReferenceId'];
    withdrawalReferenceId = json['withdrawalReferenceId'];
    component = json['component'];
    operationType = json['operationType'];
    sourceGroup = json['sourceGroup'];
    destinationGroup = json['destinationGroup'];
    requestContext = json['requestContext'] != null
        ? new RequestContext.fromJson(json['requestContext'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['document'] = this.document;
    data['signature'] = this.signature;
    data['accountReferenceId'] = this.accountReferenceId;
    data['withdrawalReferenceId'] = this.withdrawalReferenceId;
    data['component'] = this.component;
    data['operationType'] = this.operationType;
    data['sourceGroup'] = this.sourceGroup;
    data['destinationGroup'] = this.destinationGroup;
    if (this.requestContext != null) {
      data['requestContext'] = this.requestContext.toJson();
    }
    return data;
  }
}

class RequestContext {
  String userId;
  String apiKeyId;
  String ip;
  String timestamp;
  String timestampFormatted;
  final _dateFormat = DateFormat().addPattern('dd.MM.yy HH:mm:ss');

  RequestContext({this.userId, this.apiKeyId, this.ip, this.timestamp});

  RequestContext.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    apiKeyId = json['apiKeyId'];
    ip = json['ip'];
    timestamp = json['timestamp'];
    timestampFormatted = !GetUtils.isNullOrBlank(timestamp)
        ? _dateFormat.format(DateTime.parse(timestamp))
        : '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['apiKeyId'] = this.apiKeyId;
    data['ip'] = this.ip;
    data['timestamp'] = this.timestamp;
    return data;
  }
}
