class ActivationRequestsModel {
  Pagination pagination;
  List<ActivationRequest> items;

  ActivationRequestsModel({this.pagination, this.items});

  ActivationRequestsModel.empty() {
    items = List();
  }

  ActivationRequestsModel.fromJson(Map<String, dynamic> json) {
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
    if (json['items'] != null) {
      items = new List<ActivationRequest>();
      json['items'].forEach((v) {
        items.add(new ActivationRequest.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pagination != null) {
      data['pagination'] = this.pagination.toJson();
    }
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pagination {
  String cursor;
  int count;
  String order;
  String nextUrl;

  Pagination({this.cursor, this.count, this.order, this.nextUrl});

  Pagination.fromJson(Map<String, dynamic> json) {
    cursor = json['cursor'];
    count = json['count'];
    order = json['order'];
    nextUrl = json['nextUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cursor'] = this.cursor;
    data['count'] = this.count;
    data['order'] = this.order;
    data['nextUrl'] = this.nextUrl;
    return data;
  }
}

class ActivationRequest {
  int id;
  int activationRequestId;
  int vaultId;
  String vaultName;
  String message;
  String secret;
  String createdAt;

  ActivationRequest(
      {this.id,
      this.activationRequestId,
      this.vaultId,
      this.vaultName,
      this.message,
      this.secret,
      this.createdAt});

  ActivationRequest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    activationRequestId = json['activationRequestId'];
    vaultId = json['vaultId'];
    vaultName = json['vaultName'];
    message = json['message'];
    secret = json['secret'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['activationRequestId'] = this.activationRequestId;
    data['vaultId'] = this.vaultId;
    data['vaultName'] = this.vaultName;
    data['message'] = this.message;
    data['secret'] = this.secret;
    data['createdAt'] = this.createdAt;
    return data;
  }
}
