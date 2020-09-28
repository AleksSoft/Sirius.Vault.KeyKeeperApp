import 'package:intl/intl.dart';

class TransferDetailModel {
  String blockchainProtocolId;
  String operationId;
  String blockchainId;
  String networkType;
  Asset asset;
  Source source;
  Destination destination;
  String amount;
  String feeLimit;
  ClientContext clientContext;

  bool get networkInsecure => 'mainnet' == (networkType ?? '').toLowerCase();
  bool get isExternal => source.addressGroup != destination.addressGroup;
  String get addressLabel => isExternal ? 'External' : 'Internal';

  TransferDetailModel({
    this.blockchainProtocolId,
    this.operationId,
    this.blockchainId,
    this.networkType,
    this.asset,
    this.source,
    this.destination,
    this.amount,
    this.feeLimit,
    this.clientContext,
  });

  TransferDetailModel.fromJson(Map<String, dynamic> json) {
    blockchainProtocolId = json['BlockchainProtocolId'];
    operationId = json['OperationId'];
    blockchainId = json['BlockchainId'];
    networkType = json['NetworkType'];
    asset = json['Asset'] != null ? new Asset.fromJson(json['Asset']) : null;
    source =
        json['Source'] != null ? new Source.fromJson(json['Source']) : null;
    destination = json['Destination'] != null
        ? new Destination.fromJson(json['Destination'])
        : null;
    amount = json['Amount'];
    feeLimit = json['FeeLimit'];
    clientContext = json['ClientContext'] != null
        ? new ClientContext.fromJson(json['ClientContext'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['BlockchainProtocolId'] = this.blockchainProtocolId;
    data['OperationId'] = this.operationId;
    data['BlockchainId'] = this.blockchainId;
    data['NetworkType'] = this.networkType;
    if (this.asset != null) {
      data['Asset'] = this.asset.toJson();
    }
    if (this.source != null) {
      data['Source'] = this.source.toJson();
    }
    if (this.destination != null) {
      data['Destination'] = this.destination.toJson();
    }
    data['Amount'] = this.amount;
    data['FeeLimit'] = this.feeLimit;
    if (this.clientContext != null) {
      data['ClientContext'] = this.clientContext.toJson();
    }
    return data;
  }
}

class Asset {
  String symbol;
  String assetAddress;
  String assetId;

  Asset({
    this.symbol,
    this.assetAddress,
    this.assetId,
  });

  Asset.fromJson(Map<String, dynamic> json) {
    symbol = json['Symbol'];
    assetAddress = json['AssetAddress'];
    assetId = json['AssetId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Symbol'] = this.symbol;
    data['AssetAddress'] = this.assetAddress;
    data['AssetId'] = this.assetId;
    return data;
  }
}

class Source {
  String address;
  String addressGroup;
  String name;
  String tag;
  String tagType;

  Source({
    this.address,
    this.addressGroup,
    this.name,
    this.tag,
    this.tagType,
  });

  Source.fromJson(Map<String, dynamic> json) {
    address = json['Address'];
    addressGroup = json['AddressGroup'];
    name = json['Name'];
    tag = json['Tag'];
    tagType = json['TagType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Address'] = this.address;
    data['AddressGroup'] = this.addressGroup;
    data['Name'] = this.name;
    data['Tag'] = this.tag;
    data['TagType'] = this.tagType;
    return data;
  }
}

class Destination {
  String address;
  String addressGroup;
  String name;
  String tag;
  String tagType;

  Destination({
    this.address,
    this.addressGroup,
    this.name,
    this.tag,
    this.tagType,
  });

  Destination.fromJson(Map<String, dynamic> json) {
    address = json['Address'];
    addressGroup = json['AddressGroup'];
    name = json['Name'];
    tag = json['Tag'];
    tagType = json['TagType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Address'] = this.address;
    data['AddressGroup'] = this.addressGroup;
    data['Name'] = this.name;
    data['Tag'] = this.tag;
    data['TagType'] = this.tagType;
    return data;
  }
}

class ClientContext {
  final _dateFormat = DateFormat().addPattern('dd.MM.yy HH:mm:ss');
  String withdrawalReferenceId;
  String accountReferenceId;
  String timestamp;
  String userId;
  String apiKeyId;
  String iP;

  ClientContext({
    this.withdrawalReferenceId,
    this.accountReferenceId,
    this.timestamp,
    this.userId,
    this.apiKeyId,
    this.iP,
  });

  ClientContext.fromJson(Map<String, dynamic> json) {
    withdrawalReferenceId = json['WithdrawalReferenceId'];
    accountReferenceId = json['AccountReferenceId'];
    timestamp = _dateFormat.format(DateTime.parse(json['Timestamp']));
    userId = json['UserId'];
    apiKeyId = json['ApiKeyId'];
    iP = json['IP'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['WithdrawalReferenceId'] = this.withdrawalReferenceId;
    data['AccountReferenceId'] = this.accountReferenceId;
    data['Timestamp'] = this.timestamp;
    data['UserId'] = this.userId;
    data['ApiKeyId'] = this.apiKeyId;
    data['IP'] = this.iP;
    return data;
  }
}
