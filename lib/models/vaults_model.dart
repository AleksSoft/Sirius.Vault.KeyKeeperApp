class VaultsModel {
  Pagination pagination;
  List<Vault> items;

  VaultsModel({this.pagination, this.items});

  VaultsModel.empty() {
    items = List();
  }

  VaultsModel.fromJson(Map<String, dynamic> json) {
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
    if (json['items'] != null) {
      items = new List<Vault>();
      json['items'].forEach((v) {
        items.add(new Vault.fromJson(v));
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

class Vault {
  int id;
  String name;
  String type;
  String status;
  String createdAt;
  String updatedAt;

  Vault(
      {this.id,
      this.name,
      this.type,
      this.status,
      this.createdAt,
      this.updatedAt});

  Vault.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
