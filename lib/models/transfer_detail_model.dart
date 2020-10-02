import 'package:intl/intl.dart';
import 'package:get/get.dart';

class TransferDetailsModel {
  String amount;
  Asset asset;
  String blockchainId;
  String blockchainProtocolId;
  ClientContext clientContext;
  Destination destination;
  String feeLimit;
  String networkType;
  String operationId;
  Source source;

  bool get networkInsecure => 'mainnet' == (networkType ?? '').toLowerCase();
  bool get isExternal => source?.group != destination?.group;
  String get addressLabel => isExternal ? 'External' : 'Internal';

  TransferDetailsModel(
      {this.amount,
      this.asset,
      this.blockchainId,
      this.blockchainProtocolId,
      this.clientContext,
      this.destination,
      this.feeLimit,
      this.networkType,
      this.operationId,
      this.source});

  TransferDetailsModel.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    asset = json['asset'] != null ? new Asset.fromJson(json['asset']) : null;
    blockchainId = json['blockchainId'];
    blockchainProtocolId = json['blockchainProtocolId'];
    clientContext = json['clientContext'] != null
        ? new ClientContext.fromJson(json['clientContext'])
        : null;
    destination = json['destination'] != null
        ? new Destination.fromJson(json['destination'])
        : null;
    feeLimit = json['feeLimit'];
    networkType = json['networkType'];
    operationId = json['operationId'];
    source =
        json['source'] != null ? new Source.fromJson(json['source']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    if (this.asset != null) {
      data['asset'] = this.asset.toJson();
    }
    data['blockchainId'] = this.blockchainId;
    data['blockchainProtocolId'] = this.blockchainProtocolId;
    if (this.clientContext != null) {
      data['clientContext'] = this.clientContext.toJson();
    }
    if (this.destination != null) {
      data['destination'] = this.destination.toJson();
    }
    data['feeLimit'] = this.feeLimit;
    data['networkType'] = this.networkType;
    data['operationId'] = this.operationId;
    if (this.source != null) {
      data['source'] = this.source.toJson();
    }
    return data;
  }
}

class Asset {
  String assetAddress;
  String assetId;
  String symbol;

  Asset({this.assetAddress, this.assetId, this.symbol});

  Asset.fromJson(Map<String, dynamic> json) {
    assetAddress = json['assetAddress'];
    assetId = json['assetId'];
    symbol = json['symbol'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['assetAddress'] = this.assetAddress;
    data['assetId'] = this.assetId;
    data['symbol'] = this.symbol;
    return data;
  }
}

class ClientContext {
  final _dateFormat = DateFormat().addPattern('dd.MM.yy HH:mm:ss');
  String userId;
  String apiKeyId;
  String accountReferenceId;
  String withdrawalReferenceId;
  String ip;
  String timestamp;

  ClientContext(
      {this.userId,
      this.apiKeyId,
      this.accountReferenceId,
      this.withdrawalReferenceId,
      this.ip,
      this.timestamp});

  ClientContext.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    apiKeyId = json['apiKeyId'];
    accountReferenceId = json['accountReferenceId'];
    withdrawalReferenceId = json['withdrawalReferenceId'];
    ip = json['ip'];
    timestamp = GetUtils.isNullOrBlank(json['timestamp'])
        ? ''
        : _dateFormat.format(DateTime.parse(json['timestamp']));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['apiKeyId'] = this.apiKeyId;
    data['accountReferenceId'] = this.accountReferenceId;
    data['withdrawalReferenceId'] = this.withdrawalReferenceId;
    data['ip'] = this.ip;
    data['timestamp'] = this.timestamp;
    return data;
  }
}

class Destination {
  String address;
  String name;
  String group;
  String tag;
  String tagType;

  Destination({this.address, this.name, this.group, this.tag, this.tagType});

  Destination.fromJson(Map<String, dynamic> json) {
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

class Source {
  String address;
  Null name;
  String group;

  Source({this.address, this.name, this.group});

  Source.fromJson(Map<String, dynamic> json) {
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
